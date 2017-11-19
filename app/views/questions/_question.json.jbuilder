json.extract! question, :id, :formulaire_id, :nom, :typequestion, :media, :created_at, :updated_at
json.url question_url(question, format: :json)
