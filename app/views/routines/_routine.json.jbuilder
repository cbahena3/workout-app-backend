json.id routine.id
json.user routine.user.name
json.name routine.name
json.exercise_routines routine.exercise_routines do |exercise_routine|
  json.name exercise_routine.exercise.name
  json.sets exercise_routine.sets
  json.reps exercise_routine.reps
end
