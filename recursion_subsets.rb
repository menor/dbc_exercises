def choose_team(set_size, subset_size)
  return set_size if subset_size == 1
  return 0 if set_size == 0 
  choose_team(set_size-1, subset_size-1) + choose_team(set_size-1, subset_size)
end


p choose_team(6,2) == 15
p choose_team(6,3) == 20
p choose_team(24,4) == 10626
p choose_team(18,2)