def count(s, value):
    """Count the number of times value in sequence s.
    """
    total = 0
    for element in s:
        if element == value:
            total += 1
    return total
