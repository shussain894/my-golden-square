def factorial(n)
  product = 1
  p "at the start product is #{product}"
  while n > 0
    p "we multiply #{product} by #{n}"
    product *= n
    p "we get #{product}"
    n -= 1
  end
  product
end

factorial(5) # supposed to return 120