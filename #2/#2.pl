% Номер группы: 1,2,3,4,5 
group(veronikaTihomirova,1).
group(georgijVolohovskij,1).
group(arinaGaldashkina,2).
group(georgijZaharyan,2).
group(bogdanBarinov,3).
group(anastasiyaVoronina,3).
group(katyaKrutkina,1).
group(valentinaBadalyanc,1).
group(danyaHranovskij,2).
group(vsevolodBabarykin,2).
group(artyomSHapovalov,3).
group(hasanAbushev,3).
group(aleksandrKiryuhin,1).
group(vladimirToporkov,1).
group(alinaSHitenko,2).
group(aleksandrOlsh,2).
group(aleksandrAntipov,3).
group(dmitrijNechiporenko,3).
group(anyaMakarova,1).
group(andrejKutas,1).
group(irinaKnyazeva,2).
group(sergejIvanov,2).
group(renalSHambazov,3).
group(timurSamiev,3).


% Пол: 1 - мужской 2 - женский 
gender(veronikaTihomirova,2).
gender(georgijVolohovskij,1).
gender(arinaGaldashkina,2).
gender(georgijZaharyan,1).
gender(bogdanBarinov,1).
gender(anastasiyaVoronina,23).
gender(katyaKrutkina,2).
gender(valentinaBadalyanc,2).
gender(danyaHranovskij,1).
gender(vsevolodBabarykin,1).
gender(artyomSHapovalov,1).
gender(hasanAbushev,1).
gender(aleksandrKiryuhin,1).
gender(vladimirToporkov,1).
gender(alinaSHitenko,2).
gender(aleksandrOlsh,1).
gender(aleksandrAntipov,1).
gender(dmitrijNechiporenko,1).
gender(anyaMakarova,2).
gender(andrejKutas,1).
gender(irinaKnyazeva,2).
gender(sergejIvanov,1).
gender(renalSHambazov,1).
gender(timurSamiev,1).


% Сколько скидка на обучение: 1 - 10% 2 - 20%  3 - 30% 4 - 40%
sales(veronikaTihomirova,2).
sales(georgijVolohovskij,2).
sales(arinaGaldashkina,2).
sales(georgijZaharyan,2).
sales(bogdanBarinov,2).
sales(anastasiyaVoronina,2).
sales(katyaKrutkina,1).
sales(valentinaBadalyanc,1).
sales(danyaHranovskij,1).
sales(vsevolodBabarykin,1).
sales(artyomSHapovalov,1).
sales(hasanAbushev,1).

sales(aleksandrKiryuhin,3).
sales(vladimirToporkov,3).
sales(alinaSHitenko,3).
sales(aleksandrOlsh,3).
sales(aleksandrAntipov,3).
sales(dmitrijNechiporenko,3).

sales(anyaMakarova,4).
sales(andrejKutas,4).
sales(irinaKnyazeva,4).
sales(sergejIvanov,4).
sales(renalSHambazov,4).
sales(timurSamiev,4).


% Попадает ли в дедлайн: 1 - да, 2 - нет
deadline(veronikaTihomirova,1).
deadline(georgijVolohovskij,2).
deadline(arinaGaldashkina,1).
deadline(georgijZaharyan,2).
deadline(bogdanBarinov,1).
deadline(anastasiyaVoronina,2).
deadline(katyaKrutkina,1).
deadline(valentinaBadalyanc,2).
deadline(danyaHranovskij,1).
deadline(vsevolodBabarykin,2).
deadline(artyomSHapovalov,1).
deadline(hasanAbushev,2).
deadline(aleksandrKiryuhin,1).
deadline(vladimirToporkov,2).
deadline(alinaSHitenko,1).
deadline(aleksandrOlsh,2).
deadline(aleksandrAntipov,1).
deadline(dmitrijNechiporenko,2).
deadline(anyaMakarova,1).
deadline(andrejKutas,2).
deadline(irinaKnyazeva,1).
deadline(sergejIvanov,2).
deadline(renalSHambazov,1).
deadline(timurSamiev,2).

question1(X1):-	write("What group is the student from?"),nl,
			write("1. First group"),nl,
			write("2. Second group"),nl,
    		write("3. Third group"),nl,
			write("4. Fourth group"),nl,
    		write("5. Fifth group"),nl,
			read(X1).

question2(X2):-	write("Male or Female?"),nl,
			write("1. Male"),nl,
			write("2. Female"),nl,
			read(X2).

question3(X3):-	write("Is there a discount available?"),nl,
			write("1. 10%"),nl,
			write("2. 20%"),nl,
    		write("3. 30%"),nl,
			write("4. 40%"),nl,
			read(X3).

question4(X4):-	write("Does the student meet deadlines?"),nl,
			write("1. Yes"),nl,
			write("2. No"),nl,
			read(X4).

pr:-		question1(X1),question2(X2),question3(X3),question4(X4),
		group(X,X1),gender(X,X2),sales(X,X3),deadline(X,X4),
		write(X).