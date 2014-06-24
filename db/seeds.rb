# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

tipo_usuario = TipoUsuario.create([{nome: 'Usuario'}, {nome: 'Coordenação de curso'}, {nome: 'Gestão de espaços'}, {nome: 'NADD'}, {nome: 'Administrador'}])

Usuario.create({nome: 'Raphael Vidal', cgu: '102323110', tipo_usuario: tipo_usuario.last})