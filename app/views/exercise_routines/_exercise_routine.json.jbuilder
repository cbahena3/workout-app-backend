json.id exercise_routine.id
json.exercise_id exercise_routine.exercise_id
json.name exercise_routine.exercise.name

json.routine_id exercise_routine.routine_id
json.routine_name exercise_routine.routine.try(:name)

json.sets exercise_routine.sets
json.reps exercise_routine.reps
json.routine exercise_routine.routine.try(:user_id)
