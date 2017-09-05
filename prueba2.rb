def grade_average(filename)

  notas = File.open(filename, 'r').readlines

  notas.map do |ele|
    data = ele.split(', ').map(&:chomp)
    notas_alumno = data[1..5].delete_if { |n| n == 'A' }
    grades = notas_alumno.map(&:to_f)
    suma = grades.inject(0) { |sum, x| sum + x }
    average = suma / grades.length
    File.open('alumnos.txt', 'a+'){ |file| file.puts "#{data[0]} tiene promedio #{average}" }
  end
end

def total_assistance(filename)
  assistance = File.open(filename, 'r').readlines
  assistance.map do |element|
    info = element.split(', ').map(&:chomp)
    name = info[0]
    missed = info.select.count { |n| n == 'A' }
    if missed.zero?
      puts "#{name} no ha faltado a ninguna prueba."
    elsif missed == 1
      puts "#{name} ha faltado a #{missed} prueba."
    else
      puts "#{name} ha faltado a #{missed} pruebas."
    end
  end
end

def passing_students(filename)
  data = File.open(filename, 'r').readlines
  data.map do |datos|
    alumnos = datos.split(', ').map(&:chomp)
    nombre = alumnos.shift
    print nombre
  
  
  end
end

puts 'Registro de asistencias y evaluaciones', "\n"

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
         puts 'Se ha creado el archivo alumnos.txt en su directorio actual.'
         
       when 2
         total_assistance('notas.csv')
         
       when 3
         passing_students('notas.csv')
         
       when 4
         puts '¡Hasta pronto!'
         exit
       else
         puts 'La opción no es válida. Vuelve a ingresar una opción.'
       end
end
