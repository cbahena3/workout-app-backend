json.id arm.id
json.name arm.name
json.id arm.id
json.name arm.name
json.description arm.description
json.image_url arm.image_url
json.video_url arm.video_url
json.used_muscles arm.used_muscles do |used_muscle|
  json.name used_muscle.muscle_group.name
end
