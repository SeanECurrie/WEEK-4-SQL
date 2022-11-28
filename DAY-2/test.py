def is_isogram(str):
    letters = []
    lower_string = str.lower()
    for letter in lower_string:
        if letter:
            if letter in lower_string:
                return False
            letters.append(letter)
    return True

print(is_isogram('moOse'))
