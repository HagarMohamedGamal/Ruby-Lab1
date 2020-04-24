
class ComplexNumber
	attr_accessor :real, :imag
	@@state = {
		"+" => 0,
		"*" => 0,
		"bulk_add" => 0,
		"bulk_mul" => 0
	}

	def initialize(real,imag)
		@real = real
		@imag = imag
	end

	def +(cn1)
		@@state["+"] += 1
		ComplexNumber.new(
			@real + cn1.real,
			@imag + cn1.imag
		)
	end

	def *(cn1)
		@@state["*"] +=1
		ComplexNumber.new(
			@real * cn1.real - @imag * cn1.imag,
			@real * cn1.imag + @imag * cn1.real
		)
	end

	def self.bulk_add(cnArr)
		@@state["bulk_add"] +=1
		temp = ComplexNumber.new(0,0)
		cnArr.each do |item|
			temp = temp+item
		end
		temp
	end

	def self.bulk_mul(cnArr)
		@@state["bulk_mul"] +=1
		temp = ComplexNumber.new(1,0)
		cnArr.each do |item|
			temp = temp*item
		end
		temp
	end

	def self.get_stats​
		puts @@state
		# @@state.keys.each do |key|
		# 	puts "#{key} >> #{@@state[key]}\n"
		# end
	end

	def to_s
		puts "#{@real} + #{@imag}i"
	end

end

a=ComplexNumber.new(3,2)
b=ComplexNumber.new(1,7)
c=a+b
d=a*b
e=ComplexNumber.bulk_add([a,b])
f=ComplexNumber.bulk_mul([a,b])
c.to_s()
puts "=====================================\n"
d.to_s()
puts "=====================================\n"
e.to_s()
puts "=====================================\n"
f.to_s()
puts "=====================================\n"

ComplexNumber.get_stats​