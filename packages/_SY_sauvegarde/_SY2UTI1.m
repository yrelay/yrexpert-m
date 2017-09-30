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

;%SY2UTI1^INT^1^59547,73892^0
%SY2UTI1 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
CLEAR Q
 
COMPILE(PHRASE) Q PHRASE
 
OPEN(PORT,LARG,TIMEOUT) 
 I PORT="" S PORT=$I
 I LARG="" S LARG=80
 I TIMEOUT="" S TIMEOUT=0
 O PORT:(LARG):TIMEOUT
 Q
 
 
LIREFIC(GLO,FIRST,FIC) 
 N A,I,MAX,DATE,DATE1,B,DOLLARI
 S DATE1=$$TEMPS^%QMDATE,DOLLARI=$I,B=0
 C FIC
 O FIC
 S $ZT="ERRFIC"
 F I=FIRST:1 U FIC R A S @GLO@(I)=A
 S $ZT=""
 C FIC U DOLLARI
 Q
 
ECRFIC(GLO,FIRST,FIC) 
 N I,A,J,DOLLARI
 S DOLLARI=$I
 C FIC
 S $ZT="ERRFIC"
 O FIC:("WN")
 S J=$S(($D(@GLO@(FIRST))#10)=1:FIRST,1:$O(@GLO@(FIRST)))
 F I=0:0 Q:J=""  U FIC W:($D(@GLO@(J))#10)=1 !,@GLO@(J) S J=$O(@GLO@(J))
 S $ZT=""
 C FIC U DOLLARI
 Q
 
ERRFIC N A S A=$ZE I A'["ENDOF" U 0 W !,$ZE
 S $ZT="" C FIC U DOLLARI Q
 
 
BELL 
 N DOLLARI
 S DOLLARI=$I
 U 0 I ^TOZE($I,"BELL")'=0 W *7,*7,*-1
 U DOLLARI Q
 
FILE 
 
 
 
 
 
 
 
 
 
OPENFILE(FILE,MODE,IORET,OKRET) 
 N TIMEOUT
 S IORET=FILE,OKRET=1
 S $ZT="ERROPEN"
 I FILE=47 O 47 Q
 I MODE="W" O FILE:("WN") S $ZT="",OKRET=1 Q
 O FILE:("R") S $ZT="",OKRET=1 Q
ERROPEN S $ZT="",OKRET=0 Q
 
WRITE(IOR,ENREG) 
 U IOR W ENREG
 Q
READ(IOR,RES) 
 N ENREG,STATUS,ST
 S RES=1
 U IOR R ENREG
 Q ENREG
 
CLOSE(IOR,MODE) 
 C IOR
 Q
 
FIN 
 
 
 
KEYLGTH(LNOMGLO,LCLF1,LCLF2,LCLF3,LCLF4,LCLF5,LCLF6,LCLF7,LCLF8) 
 N LGM,IK,LI
 S LGM=0
 Q:'($D(LCLF1)) 1 G:LCF1>220 KEY0 S LGM=LCF1
 F IK=2:1:8 Q:'($D(@("LCLF"_IK)))  S LI=@("LCF"_IK) G:LI>220 KEY0 S LGM=(LGM+LI)+1 G:LGM>512 KEY0
 Q 1
KEY0 Q 0
 
 
KEYQRY(LCLF1,LCLF2,LCLF3,LCLF4,LCLF5) 
 Q:LCLF1>220 0 Q:LCLF2>220 0 Q:LCLF3>220 0 Q:LCLF4>220 0 Q:LCLF5>220 0 Q:((((LCLF1+LCLF2)+LCLF3)+LCLF4)+LCLF5)>508 0
 Q 1
 
 
INITSESS Q
 
 
OPENDEV(DEV) 
 O DEV Q
 
 
 
OPENDEVT(DEV,TIMOUT) 
 N OKOP S OKOP=1 O DEV::TIMOUT E  S OKOP=0
 Q OKOP
 
ZNODE() Q $I

