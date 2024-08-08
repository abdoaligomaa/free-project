import 'whatwg-fetch';

export default typeof window !== 'undefined'
  ? window.fetch.bind(window)
  : () => {};
export const Headers = typeof window !== 'undefined' ? window.Headers : {};
export const Request = typeof window !== 'undefined' ? window.Request : {};
export const Response = typeof window !== 'undefined' ? window.Response : {};
