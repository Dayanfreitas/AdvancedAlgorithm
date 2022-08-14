class BinarySearch
  
  FALSE = -1

  def self.search(key, arr, left, right)

    mid = (left + right) / 2;
    return mid if arr[mid] ==  key
    return FALSE if (left >= right)

    if (arr[mid] < key)
      return search(key, arr, mid + 1, right);
    else
      return search(key, arr, left, mid - 1)
    end
  end
  
  def self.found?(index)
    index >= 0
  end
end
