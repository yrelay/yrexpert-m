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

;TOP0CONC^INT^1^59547,74873^0
TOP0CONC ;
 S %AJCMS="Cons/Mod/Sup"
 D STTOLEX,CURRENT^%IS,ZD^%QMDATE4 K X1 S NOMTAB="^[QUI]PSRLFILI",SCR="PSRLFILI",ROUTI="^%VMULTGE(.IFLAG)"
 S NOMPROG=$T(+0)
 S NOMAP=$E(NOMPROG,4,$L(NOMPROG)),NOMPROG="^"_NOMPROG
 S NOMAJ="^TOP0AJCL"
 D ^TOP0RECC G FIN:X1=1,TOP0CONC
LOOP1 D POCLEPA^%VVIDEO,CLEBAS^%VVIDEO W "(P)arametres fixes,(R)esultats d'etudes,(CTRL F) Fin "
LOOP2 R *X1 D TOUCHE^%INCCLAV(X1,.X1) G FIN:X1=6,FIN:X1<2 S:X1>91 X1=X1-32
 S ISN=$S(X1=80:"PARF",X1=82:"RTES",1:"LOOP1") G:ISN="LOOP1" LOOP1 S DX=1,DY=23 D CLEBAS^%VVIDEO
 S SCR="PSRL"_ISN,NOMTAB="^[QUI]PSRL"_ISN,NOMAJ=$S(X1=80:"^TOP0AJBC",1:"^TOP0AJCL")
 D CLEBAS^%VVIDEO
LOOP 
RES 
 I $D(@NOMTAB@(NR))=10 S NOM=NOMTAB_"("""_NR_""")" D RES2^%VKLONG G TR
 S RS=@NOMTAB@(NR) D RES^%VKAUTGE
TR S DX=0,DY=10 X XY D CLEBAS^%VVIDEO,LOOP^%VAFIGRI,^%VAFISCR,^TOP0CMGC G LOOP1:X1=6,TOP0CONC:X1<2
FIN K CMS U 0 Q
STTOLEX I '(DTM) K (COUNT,%PROGEX,FF,MA,PIM,PIMEN,QUI,WHOIS,SUB) D VARSYS^%QCSAP Q
 S TAB125=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TAB125") K @(TAB125)
 F I="COUNT","%PROGEX","FF","MA","PIM","PIMEN","QUI","WHOIS","SUB","TAB125" S @TAB125@(I)=""
 D KEXMEM^%QCAMEM(TAB125) K TAB125 D VARSYS^%QCSAP Q

