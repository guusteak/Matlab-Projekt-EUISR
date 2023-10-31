%katy obrotu wokol stalego ukladu odniesienia
function katyobrotu(alpha_A,beta_A,gamma_A)
alpha_A_rad= deg2rad(alpha_A)
beta_A_rad= deg2rad(beta_A)
gamma_A_rad= deg2rad(gamma_A)
obr_X= [1 0 0; 0 cos(alpha_A) sin(alpha_A); 0 -sin(alpha_A) cos(alpha_A)]
obr_Y= [cos(beta_A) 0 -sin(beta_A); 0 1 0; sin(beta_A) 0 cos(beta_A)]
obr_Z= [cos(gamma_A) sin(gamma_A) 0; -sin(gamma_A) cos(gamma_A) 0; 0 0 1]
wynik = obr_Z*obr_X*obr_Y