import http from 'k6/http';
import { sleep } from 'k6';

export const options = {
  // Key configurations for breakpoint in this section
  executor: 'ramping-arrival-rate', //Assure load increase if the system slows
  stages: [
    { duration: '1h', target: 20000 }, // just slowly ramp-up to a HUGE load
  ],
  thresholds: {
    http_req_failed: ['rate<0.01'], // http errors should be less than 1%

    // 95% of requests should be below 200ms
    http_req_duration: [{
        threshold : 'p(95)<200',
        abortOnFail: true,
        delayAbortEval: '10s',
    }],
  },
};

export default () => {
  const urlRes = http.get('https://test-api.k6.io');
  sleep(0.1);
};