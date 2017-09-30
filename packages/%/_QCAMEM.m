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

;%QCAMEM^INT^1^59547,73875^0
%QCAMEM ;;02:40 PM  4 Sep 1996
 
 
 
 
 
 
 
 
 
INIT K ^SAVMEM($J) Q
 
INIT2 K ^SAVVAR($J) Q
 
MEM I '($D(^SAVMEM($J))) S ^SAVMEM($J)=0
 S %T=0,%0GLO="^SAVMEM",%0GLO2="^SATBMEM"
 S ^SAVMEM($J)=^SAVMEM($J)+1,%0=^SAVMEM($J) K ^SAVMEM($J,%0),^SATBMEM($J,%0) S %="%2" F %1=1:1 S %2=$O(@%) Q:%2=""  D AFF
FIN0 K %,%0,%0GLO,%0GLO2,%1,%2,%11,%12,%1G,%2P,%3S,%2S
FIN Q
 
VAR(LISTE) I '($D(^SAVVAR($J))) S ^SAVVAR($J)=0
 S %T=1,%0GLO="^SAVVAR",%0GLO2="^SATBVAR"
 S ^SAVVAR($J)=^SAVVAR($J)+1,%0=^SAVVAR($J) K ^SAVVAR($J,%0),^SATBVAR($J,%0) S %X="" F %1=1:1 S %2=$O(@LISTE@(%X)) Q:%2=""  D AFF
FIN1 K %X,%0,%0GLO,%0GLO2,%1,%2,%11,%12,%1G,%2P,%3S,%2S
FIN2 Q
 
AFF I ($D(@%2)#10)=1 S @%0GLO@($J,%0,%2)=@%2
 I $D(@%2)=1 G END
 
 I ($D(@%2)\10)=1 D ARRAY
END S:'(%T) %=%2
 S:%T %X=%2
 G FIN
ARRAY 
 S %1G=%0GLO_"($J,%0,%2,",%2P=%2_"(",%2S="%3S)"
DESCEND N %2L,%3S S %2L=$L(%2S)-4,%3S="" F %0Z=0:0 S %3S=$O(@(%2P_%2S)) Q:%3S=""  D SUBS
 Q
SUBS I $D(@(%2P_%2S))#10 S @(%1G_%2S)=@(%2P_%2S)
 I $D(@(%2P_%2S))\10 S %2S=$E(%2S,1,%2L)_""""_%3S_""""_",%3S)" D DESCEND S %2S=$E(%2S,1,%2L)_"%3S)"
 Q
 
 
 
RMEM G:'($D(^SAVMEM($J))) FIN K  G SUITE
RMEM2 G:'($D(^SAVMEM($J))) FIN
SUITE 
 S %0=^SAVMEM($J),%1G="^SAVMEM($J,%0)",%2G="^SAVMEM($J,%0,%2,",%2="" F %1=1:1 S %2=$O(@%1G@(%2)) Q:%2=""  D AFFR
 K ^SAVMEM($J,%0),%0,%2G,%2,%1,%2P,%1G,%2S,%3S,%1Z,%2L S ^SAVMEM($J)=^SAVMEM($J)-1 Q
 
 
 
RVAR G:'($D(^SAVVAR($J))) FINR
 S %0=^SAVVAR($J),%1G="^SAVVAR($J,%0)",%2G="^SAVVAR($J,%0,%2,",%2="" F %1=1:1 S %2=$O(@%1G@(%2)) Q:%2=""  D AFFR
 K ^SAVVAR($J,%0),%0,%2G,%2,%1,%2P,%1G,%2S,%3S,%1Z,%2L S ^SAVVAR($J)=^SAVVAR($J)-1 Q
 
AFFR I $D(@%1G@(%2))#10 S @%2=@%1G@(%2) G:'($D(@%1G@(%2))\10) FRES D ARRAY2 G FRES
 D ARRAY2
FRES Q
ARRAY2 S %2P=%2_"(",%2S="%3S)"
DESCEN2 N %2L,%3S S %2L=$L(%2S)-4,%3S="" F %1Z=0:0 S %3S=$O(@(%2G_%2S)) Q:%3S=""  D SUBS2
 Q
SUBS2 I $D(@(%2G_%2S))#10 S @(%2P_%2S)=@(%2G_%2S)
 I $D(@(%2G_%2S))\10 S %2S=$E(%2S,1,%2L)_""""_%3S_""""_",%3S)" D DESCEN2 S %2S=$E(%2S,1,%2L)_"%3S)"
 Q
FINR Q
 
 
 
EXMEM(TAB049Q) 
 S VAR049Q="" D STOCKVAR
 D MEM K
 S VAR049Q="" D RESVAR K ^GESMEM($J),VAR049Q Q
 
STOCKVAR S VAR049Q=$O(@TAB049Q@(VAR049Q)) Q:VAR049Q=""  S ^GESMEM($J,VAR049Q)=@TAB049Q@(VAR049Q) G STOCKVAR
 
RESVAR S VAR049Q=$O(^GESMEM($J,VAR049Q)) Q:VAR049Q=""  S @VAR049Q=^GESMEM($J,VAR049Q) G RESVAR
 
FEXMEM K  D RMEM Q
KEXMEM(LISTE) 
 S %T=0,@LISTE@("LISTE")=""
 S %="%2"
 F %1=1:1 S %2=$O(@%) Q:%2=""  S %=%2,%11=$P(%,"(") I '($D(@LISTE@(%11))) K @(%2) 
 K %,%1,%2,%11,@(LISTE),LISTE
 Q
 
MEMSTD D MEM
 K (WHOIS,QUI) D CURRENT^%IS,VARSYS^%QCSAP
 Q
 
 
 
 
 
 
 
 
 
 
 
 
MEMX S:'($D(^SAVVARX($J))) ^SAVVARX($J)=0 S ^SAVVARX($J)=^SAVVARX($J)+1 K ^SAVVARX($J,^SAVVARX($J))
 S %0(1)="%" F %0(8)=0:0 S %0(1)=$O(@%0(1)) Q:%0(1)=""  I %0(1)'="%0" D AFFX
 K %0
 Q
 
 
 
 
VARX(%1) S:'($D(^SAVVARX($J))) ^SAVVARX($J)=0 S ^SAVVARX($J)=^SAVVARX($J)+1 K ^SAVVARX($J,^SAVVARX($J))
 S %0(1)="" F %0(8)=0:0 S %0(1)=$O(@%1@(%0(1))) Q:%0(1)=""  I %0(1)'="%0",%0(1)'="%1" D AFFX
 K %0
 Q
 
 
 ;; cao debug ^%Q
AFFX S:$D(@%0(1))#10 ^SAVVARX($J,^SAVVARX($J),%0(1))=@%0(1) S %0(2)=%0(1) F %0(9)=0:0 S %0(2)=$$^%Q($Q(@%0(2))) Q:%0(2)=""  S ^SAVVARX($J,^SAVVARX($J),%0(2))=@%0(2)
 Q
 
 
RMEMX 
RVARX Q:'($D(^SAVVARX($J)))  S %0=^SAVVARX($J)
 Q:'($D(^SAVVARX($J,%0)))
 S %0(1)="" F %0(8)=0:0 S %0(1)=$O(^SAVVARX($J,%0,%0(1))) Q:%0(1)=""  S @(%0(1)_"=^SAVVARX($J,%0,%0(1))")
 K ^SAVVARX($J,%0) S ^SAVVARX($J)=%0-1
 K %0
 Q
 ;

