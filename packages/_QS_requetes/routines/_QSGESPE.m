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

;%QSGESPE^INT^1^59547,73881^0
QSGESPE ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
ROUTMAJ(REP,ATR) 
 N TYP
 S TYP=$$TYPM(REP,ATR) Q:TYP="" ""
 Q $$^%QSCALIN("ATTRIBUT",ATR,"ROUTINE.MISE.A.JOUR",TYP)
 
ROUTAFF(REP,ATR) 
 N TYP
 S TYP=$$TYPA(REP,ATR) Q:TYP="" ""
 Q $$^%QSCALIN("ATTRIBUT",ATR,"ROUTINE.AFFICHAGE",TYP)
 
TYPMAJ(REP,ATR) 
 N TYP
 S TYP=$$TYPM(REP,ATR) Q:TYP="" ""
 Q $$^%QSCALIN("ATTRIBUT",ATR,"TYPE.MISE.A.JOUR",TYP)
 
TYPAFF(REP,ATR) 
 N TYP
 S TYP=$$TYPA(REP,ATR) Q:TYP="" ""
 Q $$^%QSCALIN("ATTRIBUT",ATR,"TYPE.MISE.A.JOUR",TYP)
 
EX(ATR) 
 Q $$IR^%QSGE5("ATTRIBUT",ATR)
 
TYPE(ATR) 
 Q:'($$EX(ATR)) ""
 Q $$^%QSCALVA("ATTRIBUT",ATR,"TYPE")
 
CREM(ATR,ORM,TM,RM,BM) 
 Q:((((ATR="")!(ORM=""))!(TM=""))!(RM=""))!(BM="")
 D MOT^%LXSTOCK(ATR)
 D PA^%QSGESTI("ATTRIBUT",ATR,"NOM",ATR,1)
 D PA^%QSGESTI("ATTRIBUT",ATR,"TYPE.MISE.A.JOUR",TM,ORM)
 D PA^%QSGESTI("ATTRIBUT",ATR,"ROUTINE.MISE.A.JOUR",RM,ORM)
 D PA^%QSGESTI("ATTRIBUT",ATR,"BASE.MISE.A.JOUR",BM,ORM)
 Q
 
CREA(ATR,ORA,TA,RA,BA) 
 Q:((((ATR="")!(ORA=""))!(TA=""))!(RA=""))!(BA="")
 D MOT^%LXSTOCK(ATR)
 D PA^%QSGESTI("ATTRIBUT",ATR,"NOM",ATR,1)
 D PA^%QSGESTI("ATTRIBUT",ATR,"TYPE.AFFICHAGE",TA,ORA)
 D PA^%QSGESTI("ATTRIBUT",ATR,"ROUTINE.AFFICHAGE",RA,ORA)
 D PA^%QSGESTI("ATTRIBUT",ATR,"BASE.AFFICHAGE",BA,ORA)
 Q
 
SUP(ATR) 
 D SX^%QSGESTK("ATTRIBUT",ATR) Q
 
SUPM(ATR,ORM) 
 N B,R,T
 S T="TYPE.MISE.A.JOUR",B="BASE.MISE.A.JOUR",R="ROUTINE.MIS.A.JOUR"
 D PS^%QSGESTI("ATTRIBUT",ATR,T,$$^%QSCALIN("ATTRIBUT",ATR,T,ORM),ORM)
 D PS^%QSGESTI("ATTRIBUT",ATR,R,$$^%QSCALIN("ATTRIBUT",ATR,R,ORM),ORM)
 D PS^%QSGESTI("ATTRIBUT",ATR,B,$$^%QSCALIN("ATTRIBUT",ATR,B,ORM),ORM)
 Q
 
SUPA(ATR,ORA) 
 N B,R,T
 S T="TYPE.AFFICHAGE",B="BASE.AFFICHAGE",R="ROUTINE.AFFICHAGE"
 D PS^%QSGESTI("ATTRIBUT",ATR,T,$$^%QSCALIN("ATTRIBUT",ATR,T,ORA),ORA)
 D PS^%QSGESTI("ATTRIBUT",ATR,R,$$^%QSCALIN("ATTRIBUT",ATR,R,ORA),ORA)
 D PS^%QSGESTI("ATTRIBUT",ATR,B,$$^%QSCALIN("ATTRIBUT",ATR,B,ORA),ORA)
 Q
 
 
SUPREM K ^[QUI]RQSDON("REMATSPE") Q
 
SETREM(REP,ATT) 
 S ^[QUI]RQSDON("REMATSPE",REP,ATT)=$$EX(ATT)
 Q
 
 
TYPM(REP,ATR) 
 Q:'($$EX(ATR)) ""
 Q $$REP(REP,ATR,"BASE.MISE.A.JOUR")
 
TYPA(REP,ATR) 
 Q:'($$EX(ATR)) ""
 Q $$REP(REP,ATR,"BASE.AFFICHAGE")
 
REP(REP,ATR,ATT) 
 
 N %O,GLO,O,T,STOP
 S GLO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"GLO") K @(GLO)
 D MVG^%QSCALVA("ATTRIBUT",ATR,ATT,GLO,.T)
 S O="",STOP=0 F %O=0:0 S O=$O(@GLO@(O)) Q:O=""  I $$IN(@GLO@(O),REP) S STOP=1 Q
 Q:'(STOP) ""
 Q O
 
IN(LR,REP) 
 
 N FIN,I,PAR
 Q:LR="*" 1
 S FIN=0 F I=1:1 S PAR=$P(LR,",",I) Q:PAR=""  I PAR=REP S FIN=1 Q
 Q FIN
 
ATTLIEN(GLO) 
 D ATTLIEN^%QSGESPI(GLO)
 Q

