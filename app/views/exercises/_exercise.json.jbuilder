json.id exercise.id
json.name exercise.name
json.description exercise.description
json.image_url exercise.image_url
json.video_url exercise.video_url
json.used_muscles exercise.used_muscles do |used_muscle|
  json.name used_muscle.muscle_group.name
end
