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

;%PBP2FNT^INT^1^59547,73874^0
PTGENF ;
 
 
 
 
 
 
 
 
 
 
 S %9N=$$NONO(%9O,%9P,%9T,%9S) W "!R! FONT ",%9N,"; EXIT;",!
 Q
 
STRAIGHT 
 S %9N=$$NONO(%9O,%9P,%9T,%9S) W "FONT ",%9N,"; ",!
 Q
 
 I '($D(ENVL(%TERM,"NFONTE"))) S ENVL(%TERM,"NFONTE")=36 W "!R! DAF; EXIT; ",!
 I $D(ENVL(%TERM,"FONTE",%9O,%9P,%9T,%9S)) S %9N=ENVL(%TERM,"FONTE",%9O,%9P,%9T,%9S) W "!R! FONT ",%9N,"; EXIT; ",! Q
 S (%9N,ENVL(%TERM,"NFONTE"))=ENVL(%TERM,"NFONTE")+1 D GEN Q
GEN 
 W "!R! UNIT P; "
 W "GENF "
 W %9N,", "
 W """DYNAMIC5""",", "
 W $P(9*%9T,".",1),", "
 W 32,", "
 W 126,", "
 W 32,", "
 W 1,", "
 W $S(%9P="STANDARD":0,%9P="ITALIQUE":3E-1),", "
 W $S(%9O="VERTICALE":$S(%9S="D":0,%9S="B":1,%9S="G":2,%9S="H":3),%9O="HORIZONTALE":$S(%9S="D":3,%9S="B":0,%9S="G":1,%9S="H":2)),", "
 W 0,", "
 W 0,", "
 W 0,"; "
 W "UNIT C; "
 
 
 W "EXIT; ",!
 Q
 
NONO(O,P,T,S) N D,I,J,M
 I T'>5E-1 S T=5E-1 G GONO
 I T'<3 S T=3 G GONO
 S M=9999999999E-0
 F I=1/2,2/3,3/4,1,15E-1,2,3 S D=T-I S:D<0 D=-(D) S:D<M J=I,M=D
 S T=J G GONO
 
NO(O,P,T,S) 
GONO N NO,NP,NS,NT
 S NO=(($S(O="HORIZONTALE":0,1:1)*2)*7)*1
 S NP=($S(P="STANDARD":0,1:1)*7)*1
 S NT=$S(T=(1/2):0,T=(2/3):1,T=(3/4):2,T=1:3,T=15E-1:4,T=2:5,T=3:6)*1
 S NS=$S(S="D":1)
 Q (((NO+NP)+NT)+NS)+36
AUTO 
 N %9N,%9O,%9P,%9S,%9T S %9N=36
 F %9O="HORIZONTALE","VERTICALE" D TO
 Q
TO F %9P="STANDARD","ITALIQUE" D TP
 Q
TP F %9T=1/2,2/3,3/4,1,15E-1,2,3 D TT
 Q
TT F %9S="D" D TS
 Q
TS S %9N=%9N+1 D GEN Q
INIT W !,"Generation des polices de caracteres dans l'imprimante laser KYOCERA F-1010"
 W !,"Porte de l'imprimante : " R %PORT Q:%PORT=""
 W !,"Duree du time-out en secondes ? : " R TIMEOUT Q:TIMEOUT=""
GOIN C %PORT O %PORT U %PORT
 W "!R! FRPO H9, ",TIMEOUT\5,"; EXIT; " D AUTO
 W "!R! STAT; EXIT; "
 C %PORT U 0 D POCLEPA^%VVIDEO Q
 
INT D POCLEPA^%VVIDEO W "Initialisation en cours ... un instant"
 N %PORT,%TERM S %TERM=^TABIDENT(WHOIS,"TYPTAB") Q:%TERM'="KYOCERA F-1010"
 S %PORT=^TABIDENT(WHOIS,"TABTRA"),TIMEOUT=180 G GOIN
STAT D POCLEPA^%VVIDEO W "Edition du statut de l'imprimante en cours ... un instant"
 N %PORT,%TERM S %TERM=^TABIDENT(WHOIS,"TYPTAB") Q:%TERM'="KYOCERA F-1010"
 S %PORT=^TABIDENT(WHOIS,"TABTRA"),TIMEOUT=180
 C %PORT O %PORT U %PORT
 W "!R! STAT; EXIT; ",#
 C %PORT U 0 D POCLEPA^%VVIDEO Q

