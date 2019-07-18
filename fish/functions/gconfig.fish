function gconfig
	set -l size (count $argv)
    if test $size -eq 0
        gcloud config configurations list
    else if test $size -eq 1
        gcloud config configurations activate $argv[1]
    else
        echo "usage:"
        echo "  gconfig"
        echo "      list configurations"
        echo
        echo "  gconfig <configuration>"
        echo "      activate configuration"
        return 2
    end
end
