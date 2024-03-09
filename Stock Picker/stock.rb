def stock_picker(arr) 
   
   if arr.length < 2
      return
   end

   ptr1=0
   ptr2=1

   result=[0,0]
   profit=0

   while ptr2<arr.length
      if arr[ptr1] > arr[ptr2]
         ptr1=ptr2
         ptr2+=1
      else
         tempRes= arr[ptr2] -arr[ptr1]

         if tempRes > profit
            profit=tempRes
            result = [ptr1, ptr2]
         end
         
         ptr2+=1
      end
   end
   result
end

p stock_picker([17,3,6,9,15,8,6,1,10])