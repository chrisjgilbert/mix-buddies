def create_valid_mix_action
  post :create, params: { mix: { name: 'house mix', url: 'blach.com', tag_list: 'house, techno' } }
end

def create_invalid_mix_action
  post :create, params: { mix: { name: '', url: '', tag_list: '' } }
end
