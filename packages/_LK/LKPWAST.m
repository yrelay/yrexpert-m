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

;LKPWAST^INT^1^59547,74867^0
LKPWAST() 
 
 
 
 
 N I,FIN,ER,BLK,ZA,ERR,VOL,BLKI,EZA,DTA,PB,WARNING,ERO
 S ERR=$$EX^LKZ(TEMP)_",""ERR"")"
 S FIN=0,ER=0,PB=0,WARNING=0,VOL=1,BLKI=$O(@DATA@(VOL,""))
 F I=1:1 Q:$$FIN  D WRITE Q:ER  S BLKI=$O(@DATA@(VOL,BLKI))
 Q ER+WARNING
WRITE S DTA=$$EX^LKZ(DATA)_","""_VOL_""","""_BLKI_""")"
 S BLK=@DATA@(VOL,BLKI)
 S:@PVECT@("ENR")="F" BLK=$$FORMAT(BLK)
 S ERO=$$W
 S EZA=$$^LKPHYERR(ZA)
 S ER=$$ER,PB=$$PB
 S:PB WARNING=2
 I $D(DEBUG),DEBUG=1 U 0 W !,"ER  ",ER," PB ",PB
 Q
W() 
 U @PAR@("UNIT") W BLK S ZA=$ZA
 S $ZT="" Q 0
 
 
 
FORMAT(D) I $L(D)>@PVECT@("SIZ") D SETERR^LKZ(TABERR,"VT","BLK","DI",DTA) S PB=1
 Q $E(D,1,@PVECT@("SIZ"))_$J("",@PVECT@("SIZ")-$L(D))
 
 
 
FIN() Q BLKI=""
 
 
 
ER() Q (($$ERR("NO")!$$ERR("WP"))!$$ERR("EOT"))!$$ERR("TNR")
 
 
 
PB() Q (((((($$ERR("LE")!$$ERR("BGL"))!$$ERR("CRC"))!$$ERR("TCE"))!$$ERR("CDE"))!$$ERR("BTE"))!$$ERR("RLE"))!$$ERR("EOT")
 
 
 
NV() Q $$ERR("EOT")
 
ERR(A) Q $$ERR^LKPHYERR(A)
NERR(A) Q $$NERR^LKPHYERR(A)
 
TEST S TEMP="^TITI" K ^TITI
 W !,$$NB^LKZ("@TEMP@(""T"",""U"")")
 S ^TITI("T","U")=5
 W !,$$NB^LKZ("@TEMP@(""T"",""U"")")
 Q

