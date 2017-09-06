def grade_average_file(filename)

  notas = File.open(filename, 'r').readlines
  notas.map do |ele|
    data = ele.split(', ').map(&:chomp)
    notas_alumno = data[1..5].delete_if { |n| n == 'A' }
    grades = notas_alumno.map(&:to_f)
    suma = grades.inject(0) { |sum, num| sum + num }
    average = suma / grades.length
    File.open('alumnos.txt', 'a+'){ |file| file.puts "#{data[0]} tiene promedio #{average}" }
  end
end

#def average_file(filename)
  #promedio = grade_average(filename).pop
  #print "Mi promedio es #{promedio}"
#end

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

def passing_students(nota)
  data = File.open('notas.csv', 'r').readlines
  data.map do |datos|
    alumnos_notas = datos.split(', ').map(&:chomp)
    alumnos = alumnos_notas[1..5].delete_if { |e| e == 'A' }
    alumnos_final = alumnos.map(&:to_f)
    sumatoria = alumnos_final.inject(0) { |suma, g| suma + g }
    promedio = sumatoria / alumnos_final.length
    puts "Alumno aprobado: #{alumnos_notas[0]}" if promedio > nota.to_f
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
         grade_average_file('notas.csv')
         puts 'Se ha creado el archivo alumnos.txt en su directorio actual.'
         
       when 2
         total_assistance('notas.csv')
         
       when 3
         puts 'Ingresa la nota de aprobación (ej: 5.0).'
         passing_grade = gets
         passing_students(passing_grade)
         
       when 4
         puts '¡Hasta pronto!'
         exit
       else
         puts 'La opción no es válida. Vuelve a ingresar una opción.'
       end
end
