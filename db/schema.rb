# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140624051123) do

  create_table "cursos", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "coordenador_id"
  end

  create_table "disciplinas", force: true do |t|
    t.string   "nome"
    t.integer  "curso_id"
    t.integer  "professor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "disciplinas", ["curso_id"], name: "index_disciplinas_on_curso_id", using: :btree
  add_index "disciplinas", ["professor_id"], name: "index_disciplinas_on_professor_id", using: :btree

  create_table "ensalamentos", force: true do |t|
    t.integer  "disciplina_id"
    t.integer  "sala_id"
    t.integer  "periodo_id"
    t.integer  "alunos"
    t.boolean  "final",          default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "solicitante_id"
    t.integer  "deferente_id"
    t.boolean  "ativo",          default: true
  end

  add_index "ensalamentos", ["deferente_id"], name: "index_ensalamentos_on_deferente_id", using: :btree
  add_index "ensalamentos", ["disciplina_id"], name: "index_ensalamentos_on_disciplina_id", using: :btree
  add_index "ensalamentos", ["periodo_id"], name: "index_ensalamentos_on_periodo_id", using: :btree
  add_index "ensalamentos", ["sala_id"], name: "index_ensalamentos_on_sala_id", using: :btree
  add_index "ensalamentos", ["solicitante_id"], name: "index_ensalamentos_on_solicitante_id", using: :btree

  create_table "espacos", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "logs", force: true do |t|
    t.integer  "usuario_id"
    t.integer  "loggable_id"
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "loggable_type"
  end

  add_index "logs", ["loggable_id"], name: "index_logs_on_loggable_id", using: :btree
  add_index "logs", ["usuario_id"], name: "index_logs_on_usuario_id", using: :btree

  create_table "periodos", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "predios", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reservas", force: true do |t|
    t.integer  "solicitante_id"
    t.integer  "deferente_id"
    t.integer  "espaco_id"
    t.datetime "inicio"
    t.datetime "fim"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status"
    t.text     "descricao"
  end

  add_index "reservas", ["deferente_id"], name: "index_reservas_on_deferente_id", using: :btree
  add_index "reservas", ["espaco_id"], name: "index_reservas_on_espaco_id", using: :btree
  add_index "reservas", ["solicitante_id"], name: "index_reservas_on_solicitante_id", using: :btree

  create_table "salas", force: true do |t|
    t.integer  "predio_id"
    t.string   "nome"
    t.integer  "numero"
    t.integer  "capacidade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "salas", ["predio_id"], name: "index_salas_on_predio_id", using: :btree

  create_table "sugestoes", force: true do |t|
    t.integer  "sala_id"
    t.integer  "ensalamento_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sugestoes", ["ensalamento_id"], name: "index_sugestoes_on_ensalamento_id", using: :btree
  add_index "sugestoes", ["sala_id"], name: "index_sugestoes_on_sala_id", using: :btree

  create_table "tipo_usuarios", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", force: true do |t|
    t.string   "nome"
    t.string   "cgu"
    t.integer  "tipo_usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "curso_id"
  end

  add_index "usuarios", ["tipo_usuario_id"], name: "index_usuarios_on_tipo_usuario_id", using: :btree

end
