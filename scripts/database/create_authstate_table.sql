CREATE TABLE authstate (
    id UUID DEFAULT GEN_RANDOM_UUID() PRIMARY KEY,
    keycode VARCHAR(256) NOT NULL UNIQUE,
    created TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
);
