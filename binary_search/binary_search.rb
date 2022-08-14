class BinarySearch
  
  FALSE = -1

  def self.search(key, arr, l, r)    
    mid = (l + r)/2;
    return mid if arr[mid] == key
    return FALSE if (l >= r)

    if (arr[mid] < key)
        return search(key, arr, mid + 1, r);
    else
        return search(key, arr, l, mid - 1)
    end
  end
  
  def self.found?(index)
    index >= 0
  end
end
