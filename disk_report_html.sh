#!/bin/sh -
# compressed by gzexe
lines=19
prog=`/usr/bin/basename "$0"`
tmp=`/usr/bin/mktemp -d /tmp/gzexeXXXXXXXXXX` || {
/bin/echo "$prog: cannot create tmp dir"; exit 1
}
trap '/bin/rm -rf "$tmp"' 0
if /usr/bin/tail +$lines "$0" |
    /usr/bin/gzip -dc > "$tmp/$prog" 2> /dev/null; then
/bin/chmod u+x "$tmp/$prog"
"$tmp/$prog" ${1+"$@"}
ret=$?
else
/bin/echo "$prog: cannot decompress $0"
ret=1
fi
exit $ret
���Z disk_report_html.sh �TOo�6?���Q �L۽�m4k��C���Π%Z�"��H�1bv�N;݀�b���K�����۷أd�I��6�����߽O�T*6�&!s�c�l�&��
_��Z�� zb�$�u /��"�c�	xzBE�ezE�0�X�4"��K0"��N�j��gW��\6m
�i@i�|.ԝ����,XR�
>	��H(�u�Ϥ�YBP+r.67Ku��2L�4*�2D�؂P+����� �ٕǙL��+D����@�Xjs_dm�&�"����l���y^�����rx�����I�p�l�<�$��NR���k��)��n����B*����	2�gZ��e6�Y$�餺m�0)9�!\����t@��-�z�󷛟~ܼ���~�󻷛��l���x���7������3sy�^��>��I�aI�?������SԘ�"ŀ����Z�N�Q c���g��<=	<>>>�����b�s#(�"MsERť#'����ܥ[�4乕Z�st�g�LM�m��-�}�a�v���.����"n9�D��z�d�p��^oW9iҨp��g����F*�0Xe��|�����b�����#D1KcE�����Ji%V�z���o��X&�����U�.u�4�GA�u�������3��
y���W4��]-BRTPb1qW�m��aI����\#e��|\a�];<��n���UfAl�^�}j����W��W��O��V��5��H����#��tT�T\�4�������n�w	��F��K������)I��4���@�n��`�j��=�QsznV��]­�r���hc7դQ�Q��B�6�u�^v޻����?�\�ʚL��c쏔  