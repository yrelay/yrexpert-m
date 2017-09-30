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

;%TLUTCT^INT^1^59547,74031^0
%TLUTCT ;;06:49 PM  13 May 1993; ; 13 May 93  6:59 PM
 
 
 
 N GL,LIS,z,nblig,MENUH,STOMAT
 S MENUH=$$TEMP^%SGUTIL
 S @MENUH="22^10^79"
 S @MENUH@(1)=$$^%QZCHW("entrer")_"^PRINC",@MENUH@(1,"COM")=$$^%QZCHW("entrer dans la fenetre")
 S @MENUH@(2)=$$^%QZCHW("+")_"^PLUS",@MENUH@(2,"EQU")="=",@MENUH@(2,"COM")=$$^%QZCHW("page suivante")
 S @MENUH@(3)=$$^%QZCHW("-")_"^MOINS",@MENUH@(3,"EQU")="_",@MENUH@(3,"COM")=$$^%QZCHW("page precedente")
 
 S STOMAT=$$TEMP^%SGUTIL
 S GL=$$CONCAS^%QZCHAD(STOMAT,"GL")
 S LIS=$$CONCAS^%QZCHAD(STOMAT,"LIS")
 S @GL@("X")=0,@GL@("Y")=1,@GL@("L")=78,@GL@("H")=19,@GL@("TI")=$$^%QZCHW("Individus symboliques")
 S @GL@("FEN",1,"L")=75,@GL@("FEN",1,"D")=1,@GL@("FEN",1,"F")=3
 F z=1:1:3 S @GL@("LI",z,"L")=20,@GL@("CHI",z)=""
 S @GL@("UCONT","CTRB")="CTRB^%TLUTCT"
 S @GL@("LI",1,"T")="attribut temporaire",@GL@("LI",2,"T")="repertoire",@GL@("LI",3,"T")="individu"
 S NBLIG=0
 S ATTCXT="%" F A=0:0 S ATTCXT=$O(CXT(ATTCXT)) Q:ATTCXT=""  I $E(ATTCXT)="%" S NBLIG=NBLIG+1,@LIS@(NBLIG)=ATTCXT_"^"_$$NOMLOG^%QSF(CXT(ATTCXT,"BASE"))_"^"_CXT(ATTCXT,"OBJET")
 S @GL@("SUPPLEM")="SUPPLEM^%TLUTCT"
 D CLEPAG^%VVIDEO
 S IDFSTR=$$^%QUBKVI(GL,LIS,STOMAT)
 D ^%QUBKVA(IDFSTR)
BCL S DX=0,DY=21 D CLEBAS^%VVIDEO,^%VQUIKMN(1,80,23,MENUH,.ADRES,.CONTR)
 G:CONTR="" @ADRES
 K @(MENUH),@(STOMAT),@(IDFSTR)
 Q
 
PRINC S RES=$$^%QUBKVR(IDFSTR)
 G BCL
 
PLUS I '($$PLUS^%QUBKVA(IDFSTR)) D BELL^%SYSUTI1 G BCL
 D ^%QUBKVA(IDFSTR) G BCL
MOINS I '($$MOINS^%QUBKVA(IDFSTR)) D BELL^%SYSUTI1 G BCL
 D ^%QUBKVA(IDFSTR) G BCL
 
 
CTRB(GLOBA) 
 N REP,IND
 S GL=$$CONCAS^%QZCHAD(GLOBA,"GL")
 S LIS=$$CONCAS^%QZCHAD(GLOBA,"LIS")
 S L=@LIS@(LIGCOUR)
 S REP=$P(L,"^",2),IND=$P(L,"^",3)
 S REP=$$NOMINT^%QSF(REP)
 D CLEPAG^%VVIDEO,^%QSATTRI(IND,REP,2,2,70,20)
 D CLEPAG^%VVIDEO
 S OK=0,REAF=1
 Q
 
SUPPLEM(GLOBA) 
 S @GLOBA@("LIGCOUR")=LIGCOUR
 Q
 
 
INIFC(LIGCOUR) 
 Q
 
 
INITST 
 S IND=""
 F I=1:1:30 S IND=$$NXTRI^%QSTRUC8("ARTICLE",IND) Q:IND=""  S CXT("%var"_I,"BASE")="ARTICLE",CXT("%var"_I,"OBJET")=IND
 Q

