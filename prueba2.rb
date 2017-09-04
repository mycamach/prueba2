file = File.open('notas.csv', 'r')
notas = file.readlines
file.close

notas.map do |ele|
  data = ele.split(', ').map(&:chomp)
  nombre = data[0]
  notas_alumno = data[1..5]
  notas_alumno.delete_if { |n| n == 'A' }
  grades = notas_alumno.map(&:to_f)
  suma = grades.inject(0) { |sum, x| sum + x }
  promedio = suma / grades.length
  puts 'Ingrese nombre de archivo y extensión, por ejemplo: grades.txt. Se generará un archivo por alumno.'
  filename = gets.chomp
  file = File.open(filename, 'w')
  file.puts "#{nombre} tiene promedio #{promedio}"
  file.close
end

#alumno = {}
#alumno[data[0].to_sym] = notas_alumno

#def aprobados(nota)
#end

=begin
puts 'Sistema de notas', "\n"

input = 0

while input
  puts 'Ingresa 1 para generar archivos por alumno.'
  puts 'Ingresa 2 para mostrar las inasistencias totales.'
  puts 'Ingresa 3 para mostrar los alumnos aprobados.'
  puts 'Ingresa 4 para salir.'

  input = gets.chomp.to_i

  puts case input
       when 1
         puts 'Elegiste la opción 1.'
       when 2
         puts 'Elegiste la opción 2.'
       when 3
         puts 'Elegiste la opción 3.'
       when 4
         puts '¡Hasta pronto!'
         exit
       else
         puts 'La opción no es válida. Vuelve a ingresar una opción.'
       end
end

=end

