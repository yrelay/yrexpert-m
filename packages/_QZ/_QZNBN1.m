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

;%QZNBN1^INT^1^59547,73887^0
ZISNUM ;
 
 
BEG S %T1="ZISNUM" G:%PCH="" NONUM
 G:%PCH="+" NONUM G:%PCH="-" NONUM
 S @%T1@("%SIG")=$S($E(%PCH,1)="-":"-",1:""),%PCH=$S(@%T1@("%SIG")="":%PCH,1:$E(%PCH,2,500)),ISNUM=0,@%T1@("%NBP")=0,@%T1@("%F")=0
 F @%T1@("JJ")=0:0 S @%T1@("%F")=$F(%PCH,".",@%T1@("%F")) Q:@%T1@("%F")=0  S @%T1@("%NBP")=@%T1@("%NBP")+1
 G:@%T1@("%NBP")>1 FIN
 S @%T1@("GAUCHE")=$P(%PCH,".",1)
 S @%T1@("DROITE")=$P(%PCH,".",2) D NETZERO
 S @%T1@("GISNUM")=(@%T1@("GAUCHE")="")!(@%T1@("GAUCHE")?.N)
 S @%T1@("DISNUM")=(@%T1@("DROITE")="")!(@%T1@("DROITE")?.N)
 S ISNUM=@%T1@("GISNUM")&@%T1@("DISNUM")
 I ISNUM,$E(%PCH,$L(%PCH))="." S ISNUM=0
FIN S %PCH=@%T1@("%SIG")_%PCH
END K @(%T1),%T1 Q
NONUM S ISNUM=0 G END
ADR(%PCH) 
 D BEG Q ISNUM
NETZERO F @%T1@("PARTI")="GAUCHE","DROITE" S @%T1@("PGD")=@%T1@(@%T1@("PARTI")) D:$L(@%T1@("PGD"))>1 NETSUIT
 Q
NETSUIT F @%T1@("SS")=0:0 Q:$E(@%T1@("PGD"),1)'=0  S @%T1@("PGD")=$E(@%T1@("PGD"),2,$L(@%T1@("PGD"))),@%T1@(@%T1@("PARTI"))=@%T1@("PGD")
 Q
TEST W "Chaine a tester " R %PCH Q:%PCH=""  D ^%QZNBN1 S RES=$S(ISNUM=0:" La chaine n'est pas numerique",1:" La chaine est numerique") W !,RES,! G TEST
 Q
PARA(%PCH) 
 D ZISNUM Q ISNUM
 
TO N %PCH
 S %PCH=PCH
 D ^%QZNBN1
 Q
 
NORMALIS(%PCH) 
 Q:'($$ADR^%QZNBN1(%PCH))
 S %PCH=%PCH+0
 Q
TEST1 
 W !,"Chaine a normaliser : " R %PCH Q:%PCH=""  D NORMALIS^%QZNBN1(.%PCH) W !,"La chaine normalisee est : ",%PCH G TEST1

