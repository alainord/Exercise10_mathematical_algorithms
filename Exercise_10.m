% --- 1. Coeficientes de los filtros ---
b1 = [1 1 1 1 1];   % Filtro de media móvil de 5 puntos
a1 = 1;

b2 = [1 1 1 1 1 1 1 1 1];   % Filtro de media móvil de 9 puntos
a2 = 1;

% --- 2. Respuesta en frecuencia ---
[H1, w1] = freqz(b1, a1, 1024);  % 1024 puntos de frecuencia
[H2, w2] = freqz(b2, a2, 1024);

% --- 3. Magnitud de la respuesta en frecuencia ---
figure;
subplot(2,1,1);
plot(w1/pi, abs(H1), 'LineWidth', 1.5);
title('Magnitude Response - 5-point Moving Average');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('|H1(e^{j\omega})|');
grid on;

subplot(2,1,2);
plot(w2/pi, abs(H2), 'LineWidth', 1.5);
title('Magnitude Response - 9-point Moving Average');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('|H2(e^{j\omega})|');
grid on;

% --- 4. Conversión de función de transferencia a ceros, polos y ganancia ---
[z1, p1, k1] = tf2zpk(b1, a1);
[z2, p2, k2] = tf2zpk(b2, a2);

% --- 5. Gráfico de polos y ceros ---
figure;
subplot(1,2,1);
zplane(z1, p1);
title('Pole-Zero Plot - 5-point Moving Average');

subplot(1,2,2);
zplane(z2, p2);
title('Pole-Zero Plot - 9-point Moving Average');

% --- 6. Mostrar resultados en consola ---
disp('5-point Moving Average Filter:');
disp('Zeros:'); disp(z1);
disp('Poles:'); disp(p1);
disp('Gain:'); disp(k1);

disp('9-point Moving Average Filter:');
disp('Zeros:'); disp(z2);
disp('Poles:'); disp(p2);
disp('Gain:'); disp(k2);
