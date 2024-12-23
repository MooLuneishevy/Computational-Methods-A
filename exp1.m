function result = formula_1(n)
    if n == 0
        result = 0.6321;
    else
        result = round((1 - n * formula_1(n - 1)) * 10000) / 10000;
    end
end
function result = formula_2(n)
    if n == 7
        result = 0.1124;
    else
        result = round((1 - formula_2(n + 1)) / (n + 1) * 10000) / 10000;
    end
end