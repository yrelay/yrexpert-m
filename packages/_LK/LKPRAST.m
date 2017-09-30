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

;LKPRAST^INT^1^59547,74867^0
LKPRAST(DEB) 
 
 
 
 
 
 
 
 
 
 N I,FIN,ER,BLK,ZA,ERR,EZA,VOL,BLKI,WARNING,PB,TM,TMDER,FINDATA
 S ERR=$$EX^LKZ(TEMP)_",""ERR"")"
 
 S FIN=0,ER=0,WARNING=0,VOL=1,PB=0,FINDATA=0,TMDER=-1,DX=20,DY=10
 U 0 D CUROF^%VVIDEO
 F BLKI=DEB+0:1 D READ Q:FIN  Q:ER  I (BLKI#10)=0 U 0 X XY W BLKI," enregs"
 U 0 D CURON^%VVIDEO
 Q ER+WARNING
READ S ER=$$R
 
 S EZA=$$^LKPHYERR(ZA)
 S FIN=$$FIN
 S ER=$$ER
 S PB=$$PB
 S:PB WARNING=2
 I $D(DEBUG),DEBUG=1 U 0 W !,"FIN ",FIN," ER ",ER," PB",PB," TMDER ",TMDER," FD ",FINDATA
 Q
 
R() S $ZT="ERREUR^LKPHYERR"
 U @PAR@("UNIT") R BLK S ZA=$ZA,@DATA@(VOL,BLKI)=BLK
 S $ZT="" Q 0
 
 
 
 
FIN() Q $$ERR("TM")&(($$NERR("TM")=1)!($$NERR("TM")=3))
 
 
 
 
ER() Q (('($$ERR("ONL")))!$$ERR("EOT"))!$$ERR("TNR")
 
 
 
 
PB() Q (((((($$ERR("LE")!$$ERR("BGL"))!$$ERR("CRC"))!$$ERR("TCE"))!$$ERR("BTE"))!$$ERR("RLE"))!$$ERR("CDE"))!$$ERR("EOT")
 
 
 
 
NV() Q $$ERR("EOT")
 
 
 
 
TP I '($$ERR("TM")) Q
 S TM($$NERR("TM"))=BLKI
 S TMDER=$ZP(TM(""))
 I '($D(TM(TMDER-1))) Q
 W !,"TMDER-1 ",TM(TMDER-1)
 I TM(TMDER-1)'=(BLKI-1) Q
 S FINDATA=1
 Q
 
 
ERR(A) Q $$ERR^LKPHYERR(A)
 
NERR(A) Q $$NERR^LKPHYERR(A)

