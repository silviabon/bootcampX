-- Average Assistance Time
-- Get the average time of an assistance request.

SELECT AVG(completed_at - started_at) as average_assistance_request_duration
FROM assistance_requests;
