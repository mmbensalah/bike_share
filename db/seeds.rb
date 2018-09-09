# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
Station.destroy_all
Station.destroy_all
Station.destroy_all
Station.destroy_all
CSV.foreach("./db/csv/station.csv", headers: true, header_converters: :symbol) do |row|
  Station.create( id:                      row[:id],
                  name:                    row[:name],
                  dock_count:              row[:dock_count],
                  city:                    row[:city],
                  installation_date:       row[:installation_date],
                  created_at:              row[:created_at],
                  updated_at:              row[:updated_at]
                )
end
CSV.foreach("./db/csv/status.csv", headers: true, header_converters: :symbol) do |row|
  Station.create( id:                      row[:id],
                  name:                    row[:name],
                  dock_count:              row[:dock_count],
                  city:                    row[:city],
                  installation_date:       row[:installation_date],
                  created_at:              row[:created_at],
                  updated_at:              row[:updated_at]
                )
end
