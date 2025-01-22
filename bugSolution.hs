```haskell
import Data.List (sort)
import Data.Ord (comparing)
import Data.Function (on)

-- Example using a custom sort optimized for nearly sorted data (Insertion sort) 
insertionSort :: Ord a => [a] -> [a]
insertionSort [] = []
insertionSort (x:xs) = insert x (insertionSort xs)
  where
    insert x [] = [x]
    insert x (y:ys) = if x <= y then x : y : ys else y : insert x ys

main :: IO ()
main = do
  let xs = [1, 2, 3, 4, 5]
  let ys = insertionSort xs -- Using insertion sort
  print ys

  let largeList = [1000000, 999999..1]
  let sortedLargeList1 = sort largeList  --Using mergesort
  let sortedLargeList2 = insertionSort largeList --Using Insertion sort

  print $ "Mergesort time: " ++ show (length sortedLargeList1)
  print $ "Insertion sort time: " ++ show (length sortedLargeList2)
  -- Note: Time measurement requires more sophisticated methods
```