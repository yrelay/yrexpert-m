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

;%QMEXAT6^INT^1^59547,73878^0
%QMEXAT6 ;;12:02 PM  19 Nov 1993; 14 Oct 92  5:03 PM ; 19 Nov 93  3:00 PM
 
 
 
 
 
SOLVEPB(REPIND,IND,NOEUD,TMP1,TMP2) 
 N OR,ATNASSO,VAL,%FIN,NOMRESO,REPPERE,NOTE,LGLO,TYP,TYPREG,RES,ETUF,ETUP
 D CLEAR^%SYSUTI1
 S LGLO=$$TEMP^%SGUTIL
 S REP=$$REPETAT,REPPERE=$$REPRESO,NOMRESO=$$NOMRESO(NOEUD)
 
 I $E(^TOZE($J,"JRN"),$L(^TOZE($J,"JRN"))-1) D NOUVINST^%AMJAJ($$GET^%SGVAR("JRN"),"changement d'individu courant",$$GET^%SGVAR("RESEAU")_$C(0)_$$GET^%SGVAR("ETAT")_$C(0)_REPIND_$C(0)_IND),ADDEXEC^%AMJAJ($$GET^%SGVAR("JRN"),"COURANT","",$S(REPIND="":"???",1:REPIND),$S(IND="":"???",1:IND))
 
 
 
 G:'($$AIR^%QSGE5(REP,NOEUD,"COMMENTAIRE.PROLOGUE")) REGLES
 G:$$^%QSCALIN(REPPERE,NOMRESO,"CONTEXTE.D.ACTIVATION","EXPERT")=1 REGLES
 K @(LGLO)
 D MVG^%QSCALVA(REP,NOEUD,"COMMENTAIRE.PROLOGUE",LGLO,.TYP)
 S OR=$O(@LGLO@("")),NOTE=@LGLO@(OR)
 D AFF^%QSNOTE2(0,11,80,11,REP,NOEUD,"COMMENTAIRE.PROLOGUE",NOTE,OR,REPIND,IND,"$$AFFICH^%QMEAROU")
 K @(LGLO)
 
REGLES 
 
 S OR=0
BCREG S OR=OR+1
 G:'($$OAIR^%QSGE5(REP,NOEUD,"REGLE",OR)) FINREG
 S VAL=$$VALEUR^%QSTRUC8(REP,NOEUD,"REGLE",OR)
 S TYPREG=$P(VAL,"\")
 G:TYPREG="TRAITER" TRAITER G:TYPREG="QUEMANDER" QUEMAND G BCREG
 
 
 
TRAITER 
 S VAL=$P(VAL,"\",2)
 
 I $D(^BATCHMOD($J)),^BATCHMOD($J) S RES=$$TRTMAP^%TLOB17(VAL,REPIND,IND) G TRT2
 
 
 S ETUP=""
 I $E(^TOZE($J,"JRN"),$L(^TOZE($J,"JRN"))-1) S ETUP=$$GET^%SGVAR("JRN") D NOUVINST^%AMJAJ(ETUP,"execution d'un traitement",NOMRESO_$C(0)_$P(NOEUD,",",2)_$C(0)_REPIND_$C(0)_IND),ADDEXEC^%AMJAJ(ETUP,"REGLE","",VAL,"","","","","")
 
 I $E(^TOZE($J,"JRN"),$L(^TOZE($J,"JRN"))) D EXECTRT^%AMREXDK(VAL,REPIND,IND)
 I '($E(^TOZE($J,"JRN"),$L(^TOZE($J,"JRN")))) S RES=$$CONTEXT^%TLIACUN(VAL,REPIND,IND,0,0,0,.CXT,.ABANDON)
 I $E(^TOZE($J,"JRN"),$L(^TOZE($J,"JRN"))-1) S ETUP=$$GET^%SGVAR("JRN") D AJJOURN^%AMJAJ(ETUP,"retour de l'execution d'un traitement")
 
TRT2 G BCREG
 
 
 
QUEMAND 
 S VAL=$P(VAL,"\",2)
 D ACTAFF^%QMEAACT("SAISIE.I",VAL,0,0,78,10,0,11,78,11,REPIND,IND,"$$AFFICH^%QMEAROU","AFFECT^%QMEAROU")
 D CLEPAG^%VVIDEO
 G BCREG
 
 
FINREG 
 S ATNASSO=$$^%QSCALIN(REP,NOEUD,"RESEAU.ASSOCIE",1)
 G:ATNASSO="" EPIL
 S ETUF=""
 G:'($E(^TOZE($J,"JRN"),$L(^TOZE($J,"JRN"))-1)) APPAT
 
 S ETUP=""
 S ETUP=$$GET^%SGVAR("JRN")
 D NOUVINST^%AMJAJ(ETUP,"appel d'un reseau",NOMRESO_$C(0)_$P(NOEUD,",",2)_$C(0)_REPIND_$C(0)_IND)
 D ADDEXEC^%AMJAJ(ETUP,"RESEAU","",ATNASSO,"","","","","")
 
 S ETUF=$$CHAINAUTO^%AMG("HEVEA")
 D INIT^%AMG(ETUF,"HEVEA",ATNASSO,REPIND,IND,"","")
 
 D SET^%SGVAR("JRN",ETUF)
APPAT 
 D APPATN(ATNASSO,TMP1,TMP2)
 I ETUF'="" D DEP^%SGVAR("JRN")
 I $E(^TOZE($J,"JRN"),$L(^TOZE($J,"JRN"))-1) S ETUP=$$GET^%SGVAR("JRN") D AJJOURN^%AMJAJ(ETUP,"retour d'une execution de reseau")
 
EPIL 
 
 G:'($$AIR^%QSGE5(REP,NOEUD,"COMMENTAIRE.EPILOGUE")) FIN
 G:$$^%QSCALIN(REPPERE,NOMRESO,"CONTEXTE.D.ACTIVATION","EXPERT")=1 FIN
 K @(LGLO)
 D MVG^%QSCALVA(REP,NOEUD,"COMMENTAIRE.EPILOGUE",LGLO,.TYP)
 S OR=$O(@LGLO@("")),NOTE=@LGLO@(OR)
 D AFF^%QSNOTE2(0,11,80,11,REP,NOEUD,"COMMENTAIRE.EPILOGUE",NOTE,OR,REPIND,IND,"$$AFFICH^%QMEAROU")
 K @(LGLO)
 
FIN D CLEAR^%SYSUTI1
 Q
 
 
 
NOMRESO(ETAT) Q $P(ETAT,",")
REPRESO() Q $$NOMINT^%QSF("RESEAU")
REPETAT() Q $$NOMINT^%QSF("ETAT.RESEAU")
 
 
 
 
 
APPATN(ATNASSO,TMP1,TMP2) 
 N %VNG,%VNGA,TEMPENT,TEMPSOR,%VNE,%VNI
 N TAB125,I
 S TEMPENT=$$TEMP^%SGUTIL
 S TEMPSOR=$$TEMP^%SGUTIL
 D COPY^%QCAGLC("^PARAENT("_$J_")",TEMPENT)
 D COPY^%QCAGLC("^PARASOR("_$J_")",TEMPSOR)
 K ^PARAENT($J),^PARASOR($J)
 S %VNG(5)=ATNASSO
 
 D SET^%SGVAR("RESEAU",ATNASSO)
 S %VNGA=1
 S %VNE(%VNGA,1)=%VNG(5)
 S %VNE(%VNGA,2)=$$GEN^%QCAPOP("ATN")
 S %VNE(%VNGA,3)=$S(TMP2=0:0,1:$$VISIBLE^%ATNEXE3(ATNASSO))
 S %VNE(%VNGA,7)=TMP1-1
 S %FIN=0
 S ^PARAENT($J,%VNGA,"REPFOC")=REPIND
 S ^PARAENT($J,%VNGA,"INDFOC")=IND
 D COPY2^%QCAGLC("CXT","^PARAENT("_$J_",1,""CXT"")")
 
 S TAB125=$$TEMP^%SGUTIL
 D MEMX^%QCAMEM
 F I="QUI","WHOIS","TAB125","%VNE","%VNGA","%VNG","%FIN" S @TAB125@(I)=""
 D KEXMEM^%QCAMEM(TAB125)
 D CURRENT^%IS,VARSYS^%QCSAP
 
 D START^%ATNEXE
 
 K  D RMEMX^%QCAMEM
 
 D DEP^%SGVAR("RESEAU")
 
 
 
 D COPY2^%QCAGLC("^PARASOR("_$J_",1,""CXT"")","CXT")
 K ^PARAENT($J),^PARASOR($J)
 D COPY^%QCAGLC(TEMPENT,"^PARAENT("_$J_")")
 D COPY^%QCAGLC(TEMPSOR,"^PARASOR("_$J_")")
 Q

