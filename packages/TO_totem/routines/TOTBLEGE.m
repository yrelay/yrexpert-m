;!----------------------------------------------------------------------------!
;!                                                                            !
;! Licence et conditions d'utilisation                                        !
;! Yexpert : (your) Systeme Expert sous Mumps GT.M et GNU/Linux               !
;! Copyright (C) 2001-2015 by Hamid LOUAKED (HL).                             !
;!                                                                            !
;! Hamid LOUAKED                                                              !
;! 10, impasse Faraday                                                        !
;! 78520 LIMAY                                                                !
;! France                                                                     !
;!                                                                            !
;! yexpert@yrelay.fr                                                          !
;! http://www.yrelay.fr/                                                      !
;!                                                                            !
;! Ce programme est un logiciel libre ; vous pouvez le redistribuer           !
;! et/ou le modifier conformement aux dispositions de la Licence Publique     !
;! Generale GNU, telle que publiee par la Free Software Foundation ;          !
;! version 3 de la licence, ou encore (a votre choix) toute version ulterieure.
;!                                                                            !
;! Ce programme est distribue dans l'espoir qu'il sera utile,                 !
;! mais SANS AUCUNE GARANTIE ; sans meme la garantie implicite de             !
;! COMMERCIALISATION ou D'ADAPTATION A UN OBJET PARTICULIER.                  !
;! Pour plus de details, voir la Licence Publique Generale GNU.               !
;!                                                                            !
;! Un exemplaire de la Licence Publique Generale GNU doit etre fourni avec    !
;! ce programme ; si ce n'est pas le cas,                                     !
;! ecrivez a la Free Software Foundation Inc.,                                !
;! 675 Mass Ave, Cambridge, MA 02139, Etats-Unis.                             !
;!                                                                            !
;! Ce logiciel est telechargeable a l'adresse http://www.yrelay.fr/ ;         !
;! vous trouverez egalement, sur ce site, un mode d'emploi complet            !
;! et des informations supplementaires.                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;!                                                                            !
;! GNU General Public License : http://www.gnu.org/copyleft/gpl.html          !
;!                                                                            !
;! Traduction francaise : http://dachary.org/loic/gpl-french.pdf              !
;!                                                                            !
;!----------------------------------------------------------------------------!

;!============================================================================!
;! Nomprog     :                                                              !
;! Module      :                                                              !
;! But         :                                                              !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;TOTBLEGE^INT^1^59547,74876^0
TOTBLEGE ;
 
 
 
 
 N %9X,%9X1,%9X2,%9Y,%9Y1,%9Y2,%9AD,%9AF,%9T,%TC,%9R,%TYPLOGO,%LIBEL,%9STR,%9O
 N DXG,DXD,DYH,DYB,%PORT,%TERM,ENVL
 S DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG=$$^%QZCHW("LEGENDE DES ARBRES DE SF") D CLEPAG^%VVIDEO,TO4^%VZCD
TEST D POCLEPA^%VVIDEO W $$^%QZCHW("Terminal = (E)cran graphique ou (T)able tracante ? : ") R *%TERM
 G:(%TERM=1)!(%TERM=13) FIN
 I (%TERM'=$A($$^%QZCHW("E")))&(%TERM'=$A($$^%QZCHW("T"))) D ^%VSQUEAK G TEST
 S %PORT=$S(%TERM=$A($$^%QZCHW("E")):^TABIDENT(WHOIS,"ECRGRA"),1:^TABIDENT(WHOIS,"TABTRA"))
 S %TERM=$S(%TERM=$A($$^%QZCHW("E")):^TABIDENT(WHOIS,"TYPECR"),1:^TABIDENT(WHOIS,"TYPTAB"))
 I %PORT'=0 D MSG^%VZEATT($$^%QZCHW("impression en cours"))
 C %PORT O %PORT
 D:(%PORT=$I)!(%PORT=0) CLEPAG^%VVIDEO,^%PBPZGRA,^%PBPZCLR
 S (%9NCO,%9NLI)=1
 S %FONC="INIT" D ^%PBPZ
 I %TERM="HP-KYO" K %9O
 S %FONC="INIT.DESSIN" D ^%PBPZ
 S %FONC="PRENDRE" D ^%PBPZ
 S %FONC="CADRE" D ^%PBPZ
 S %FONC="MOUV",%9X=3000,%9Y=2920 D CONV,^%PBPZ
 S %FONC="TEXT",%9STR=$$^%QZCHW("Le ")_%DAT D ^%PBPZ
 S %FONC="CRAYON",%9TC="FEUTRE",%9CL="VERT" D ^%PBPZ
 S %FONC="MOUV",%9X=100,%9Y=3120-(100*6) D CONV,^%PBPZ
 S %FONC="LBREL",%9LXY="50,0,0,50,-50,0,0,-50" D ^%PBPZ
 S %FONC="MOUV",%9X=100,%9Y=3120-(100*7) D CONV,^%PBPZ
 S %FONC="LBREL",%9LXY="50,0,-25,50,-25,-50" D ^%PBPZ
 S %FONC="MOUV",%9X=100,%9Y=3120-(100*8) D CONV,^%PBPZ
 S %FONC="ARCREL",%9AD=0,%9AF=35999E-2,%9X=25,%9Y=0,%9R=25 D ^%PBPZ
 S %FONC="CRAYON",%9TC="FEUTRE",%9CL="NOIR" D ^%PBPZ
 F I=1:1 Q:$T(TEXT+I)=""  D LIGNE
 S %TYPLOGO=3,%COUL=1,%LIBEL=0,%Z=1,%9X=3000,%9Y=500,%INCLIN=1 D ^%PBMLOM
 I %PORT'=0 S %FONC="CLEAR" D ^%PBPZ S %FONC="PRINTER" D ^%PBPZ C %PORT
 I (%PORT=$I)!(%PORT=0) D ^%PBPZALF
 D ^%VZEAVT("")
 D ^%PBPZGRA,^%PBPZCLR,^%PBPZALF
FIN K DXG,DXD,DYB,DYH,GRAPH,%FONC,I,MSG,%9NCO,%9NLI,%9STR,%9X,%9Y,%TERM,%PORT Q
LIGNE S %FONC="MOUV",%9X=$P($T(TEXT+I),";;",2),%9Y=3120-(I*100) D CONV,^%PBPZ
 S %FONC="TEXT",%9STR=$P($T(TEXT+I),";;",3) D ^%PBPZ
 Q
 
CONV 
 N %FONC S %FONC="CONVERSION.X" D ^%PBPZ S %FONC="CONVERSION.Y" D ^%PBPZ Q
 
TEXT 
 ;;100;;
 ;;500;;LEGENDE DES ARBRES DE SAVOIR FAIRE
 ;;100;;
 ;;100;;
 ;;200;;Les symboles verts
 ;;400;;= attribut EXPLICITE ou regle SINON
 ;;400;;= regle
 ;;400;;= attribut IMPLICITE
 ;;100;;
 ;;200;;Les references
 ;;200;;P:x/y/z   = le noeud a deja ete etudie en
 ;;300;;page x
 ;;300;;ligne y
 ;;300;;colonne z
 ;;200;;PH:x/y/z  = les fils du noeuds continuent en
 ;;300;;page x
 ;;300;;ligne y
 ;;300;;colonne z
 ;;200;;PV:x/y/z  = l'etude du noeud est renvoyee en
 ;;300;;page x
 ;;300;;ligne y
 ;;300;;colonne z

