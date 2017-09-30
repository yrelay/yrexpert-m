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

;%QS0G3^INT^1^59547,73879^0
QS0G3() 
 
 
 
 
 
 N TEST,HIS,ERR,MES,LISTE,%AJM,NOMTAB,SCR,INTERV
 
 S LISTE=$$UN^%QUAPAGM Q:LISTE="" 1
 
 D NOMHIS^%HXIHITU(.HIS)
 I HIS="" Q 1
 S MES=$$VERIF^%HXIHITU(1,LISTE,.ERR) I ERR Q 0
 S %AJM="A",CMS=0,SCR="HISTOPAR",NOMTAB=""
 D CLEPAG^%VVIDEO,^%VACTISC(SCR)
 S TEST=1
 F I=1:1:^%SCRE(SCR) S TEST=TEST&(RESUL(I)'="")
 D KILL
 Q:TEST=0 2
 S:'($D(INTERV)) INTERV=0
 S MES=$$HSIM^%HXIHITR($$ADRHIS^%HXIHITU,HIS,1,LISTE,RESUL(1),RESUL(2),RESUL(3)="O",$S(RESUL(4)="O":1,RESUL(4)="N":0),$S(RESUL(5)="T":1,1:0),INTERV,1,"",.ERR)
 I ERR Q 0
 Q 2
 
KILL 
 K %AJM,%LIXG,%LIXD,%LIYB,%LIYH,%U,%V,IC,ICC,IK,ADX,ADY,NDX,NDY,ODX,ODY
 K PCX,PCY,LXD,LXG,CMS,ABENDSCR,SCR,SCR1,UCONT,REFUSE,STOPUC,ECR
 K TAB,FRESU,PATOUCH,NOMTAB,TAB1,DEJALU,VID,PCH,PCHCOMP,PS,BASI
 Q
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
FONC(ATTR,ET,AT,FONC) Q:ATTR="" 0
 Q:$L(ATTR,"^")>2 0
 S REP=$P(ATTR,"^",2)
 S FONC=$S(REP="":"",ET=0:"$$^%QSCALVU("""_REP_""")",1:"$$CUM^%QS0G3("""_REP_""")")
 S AT=$S(REP="":ATTR,1:$P(ATTR,"^"))
 Q 1
 
 
 
CUM(REPDES,REP,IND,ATTR) 
 N SOM,I,%I,GLS,TYP,OK
 S SOM=0
 S OK=$$MV^%QSCAPRO(REPDES,REP,IND,ATTR,1,.GLS,.TYP)
 Q:'(OK) 0
 Q:GLS=0 0
 S SOM=0,I=-1
 F %I=0:0 S I=$N(GLS(I)) Q:I=-1  S SOM=SOM+GLS(I)
 Q SOM

