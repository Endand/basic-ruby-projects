# frozen_string_literal: true

def bubble_sort(arr)
  (arr.length - 1).downto(1) do |i|
    ptr1 = 0
    ptr2 = 1
    while ptr2 <= i

      if arr[ptr1] > arr[ptr2]
        temp = arr[ptr1]
        arr[ptr1] = arr[ptr2]
        arr[ptr2] = temp
      end
      ptr1 += 1
      ptr2 += 1
    end
  end
  arr
end

p bubble_sort([4, 3, 78, 2, 0, 2])
