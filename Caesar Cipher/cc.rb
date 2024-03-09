def caesar_cipher(str,key)
   modified=[]
   str.each_char do |c|
      modified_char=c.ord+key
      if (c.match?(/[a-zA-Z]/) )
         if modified_char > 'z'.ord
            modified_char = (modified_char - 'z'.ord - 1) + 'a'.ord
         elsif c.match?(/[A-Z]/) && (modified_char > 'Z'.ord)
            modified_char = (modified_char - 'Z'.ord - 1) + 'A'.ord
         end
         modified << (modified_char).chr
      else
         modified << c
      end
   end
   p modified.join
end

caesar_cipher("What a string!",5)