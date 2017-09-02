file = File.open('notas.csv', 'r')
notas = file.read
file.close

print notas

puts 'Sistema de notas'

input = 0
while input != 4
  puts 'Ingrese 1 para generar archivos por alumno'
  puts 'Ingrese 2 para mostrar las inasistencias totales'
  puts 'Ingrese 3 para mostrar los alumnos aprobados'
  puts 'Ingrese 4 para salir'

  input = gets.chomp

  puts case input
       when 1
         puts 'Elegiste la opción 1'
       when 2
         puts 'Elegiste la opción 2'
       when 3
         puts 'Elegiste la opción 3'
       when 4
         exit
       end
end

