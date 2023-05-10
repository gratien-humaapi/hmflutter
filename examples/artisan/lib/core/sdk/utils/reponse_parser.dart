//

errorResponse<T>(T error) => {'data': null, 'error': error};
response<T>(T data) => {'data': data, 'error': null};

isResolved(Map payload) => payload['data'] != null;
