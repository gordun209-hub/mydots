

# Make a backup file
function backup --argument filename
    cp $filename $filename.bak
end
