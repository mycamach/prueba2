def grade_average(filename)

  file = File.open(filename, 'r') # refactorizar!
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
    file = File.open('promedio_alumnos.txt', 'a+')
    file.puts "#{nombre} tiene promedio #{promedio}"
    file.close

    #alumnos = {}
    #alumnos[nombre.to_sym] = promedio

    #file = File.open('promedio_alumnos.txt', 'a') do |average|
    #  alumnos.each { |k, v| average.puts "#{k} tiene promedio #{v}" }
    #end
  end
end

def total_assistance(filename)
  file = File.open(filename, 'r')
  assistance = file.readlines
  file.close

  assistance.map do |element|
    info = element.split(', ').map(&:chomp)
    name = info[0]
    miss = info.select.count { |n| n == 'A' }
    if miss.zero?
      puts "#{name} no ha faltado a ninguna prueba."
    elsif miss == 1
      puts "#{name} ha faltado #{miss} vez a prueba."
    else
      puts "#{name} ha faltado #{miss} veces a prueba."
    end
  end
end

puts 'Sistema de notas', "\n"

input = 0

while input
  puts 'Ingresa 1 para crear un archivo con los alumnos y sus promedios.'
  puts 'Ingresa 2 para mostrar las inasistencias totales por alumno.'
  puts 'Ingresa 3 para mostrar los alumnos aprobados.'
  puts 'Ingresa 4 para salir.'

  input = gets.chomp.to_i

  puts case input
       when 1
         grade_average('notas.csv')
         puts 'Se ha creado el archivo promedio_alumnos.txt en su directorio'
         
       when 2
         total_assistance('notas.csv')
         
       when 3
         puts 'Elegiste la opción 3.'
       when 4
         puts '¡Hasta pronto!'
         exit
       else
         puts 'La opción no es válida. Vuelve a ingresar una opción.'
       end
end

