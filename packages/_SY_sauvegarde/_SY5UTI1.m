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

;%SY5UTI1^INT^1^59547,73892^0
%SY5UTI1 ;;06:10 PM  17 Nov 1993; ; 17 Nov 93  6:13 PM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
CLEAR Q
 
 
COMPILE(PHRASE) Q $XECUTE(PHRASE)
 
OPEN(PORT,LARG,TIMEOUT) 
 I PORT="" S PORT=$I
 O PORT
 Q
 
 
LIREFIC(GLO,FIRST,FIC) 
 N IOF,TIMEOUT,ERR,I,A,ST,STATUS
 S IOF=FIC,TIMEOUT=500
 S ERR="",$ZT="ERRFIC1"
 O IOF:(MODE="R"):TIMEOUT
 S $ZT="ERRENDOF"
 F I=FIRST:1 U IOF R A S @GLO@(I)=A
ENDL C IOF
 Q
ERRFIC1 
 S ERR=$ZE,$ZT="" D COLR^%VZEAVT(FIC_$$^%QZCHW(" : Fichier introuvable"),0,79,0) Q
 
ERRENDOF 
 S ERR=$ZE,$ZT="" I $E(ERR,1,11)="<ENDOFFILE>" G ENDL
 U 0 D ^%VZEAVT($$^%QZCHW("Probleme lors de la lecture du fichier"))
 G ENDL
 
 
ECRFIC(GLO,FIRST,FIC) 
 N A,I,MAX,DATE,DATE1,B,J,IOF,TIMEOUT,ERR
 S DATE1=$$TEMPS^%QMDATE,B=0,IOF=FIC,TIMEOUT=1000
 S ERR="",$ZT="ERRFIC2"
 O IOF:(MODE="W"):TIMEOUT
 S $ZT=""
 S J=$S(($D(@GLO@(FIRST))#10)=1:FIRST,1:$O(@GLO@(FIRST)))
 F I=0:0 Q:J=""  U IOF W:($D(@GLO@(J))#10)=1 @GLO@(J),! S J=$O(@GLO@(J))
 C IOF
 Q
ERRFIC2 
 S ERR=$ZE,$ZT="" D COLR^%VZEAVT(FIC_$$^%QZCHW(" : ecriture impossible"),0,79,0) Q
 
 
BELL N DOLLARI
 S DOLLARI=$I
 U 0 I ^TOZE($I,"BELL")'=0 W *7
 U DOLLARI Q
 
 
 
 
 
 
 
 
 
 
OPENFILE(FIC,MODE,IORET,OKRET) 
 N TIMEOUT
 S IORET=FIC
 S $ZT="ERROPEN",TIMEOUT=10
 O IORET:(MODE=MODE):TIMEOUT E  G ERROPEN
 S $ZT="",OKRET=1 Q
ERROPEN S $ZT="",OKRET=0 Q
 
WRITE(IOR,ENREG) 
 U IOR W ENREG,!
 Q
READ(IOR,RES) 
 N ENREG,STATUS,ST,DOLLARI
 S RES=1
 S $ZT="ERREAD"
 U IOR R ENREG S $ZT="" Q ENREG
ERREAD S $ZT="",RES=0 Q ""
 
CLOSE(IOR,MODE) 
 
 C IOR
 Q
 
 
KEYLGTH(LNOMGLO,LCLF1,LCLF2,LCLF3,LCLF4,LCLF5,LCLF6,LCLF7,LCLF8) 
 N LGM,IK
 S LGM=LNOMGLO
 F IK=1:1:8 Q:'($D(@("LCLF"_IK)))  S LGM=(LGM+@("LCLF"_IK))+2 G:LGM>246 KEY0
 
 Q 1
KEY0 Q 0
 
 
KEYQRY(LCLF1,LCLF2,LCLF3,LCLF4,LCLF5) 
 Q (((((16+LCLF1)+LCLF2)+LCLF3)+LCLF4)+LCLF5)<247
 
INITSESS 
 D:'($D(^%PK($I))) COPY^%QCAGLC("^%PK(""DTMVXREF"")","^%PK("""_$I_""")")
 D:'($D(^%IS($I))) COPY^%QCAGLC("^%IS(""DTMVXREF"")","^%IS("""_$I_""")")
 Q
 
 
OPENDEV(DEV) 
 N PARAMO,LIGOP
 S PARAMO=$S($D(^%OPENPARA(DEV)):":"_^%OPENPARA(DEV),1:"")
 S LIGOP=$S((DEV+0)=DEV:"O "_DEV_PARAMO,1:" O """_DEV_""""_PARAMO)
 X LIGOP
 Q
 
 
 
OPENDEVT(DEV,TIMOUT) 
 N PARAMO,LIGOP,OKOP
 S PARAMO=$S($D(^%OPENPARA(DEV)):^%OPENPARA(DEV),1:"")
 I (DEV+0)=DEV S LIGOP="S OKOP=1 O "_DEV_":"_PARAMO_":"_TIMOUT_" E  S OKOP=0"
 I (DEV+0)'=DEV S LIGOP="S OKOP=1 O """_DEV_""":"_PARAMO_":"_TIMOUT_" E  S OKOP=0"
 X LIGOP
 Q OKOP
 
ZNODE() Q $I

