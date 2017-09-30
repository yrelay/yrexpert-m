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

;%QMEXTRA^INT^1^59547,73878^0
%QMEXTRA ;;11:38 AM  19 Nov 1993; 17 Feb 93 11:22 AM ; 19 Nov 93  2:59 PM
 
 
 
ALONE N REP,IND,%I,IQMEX,TMPX,VALI1,VALI2
 S VALI1=%VNI(%VNGA,7),VALI2=%VNE(%VNGA,3)
 D SOLVEPB(^PARAENT($J,%VNGA,"REPFOC"),^PARAENT($J,%VNGA,"INDFOC"),NOEUD,VALI1,VALI2)
 Q
%QMEXAT6 ;;05:23 PM  28 Oct 1993; 14 Oct 92  5:03 PM ; 28 Oct 93  6:01 PM
 
 
SOLVEPB(REPIND,IND,NOEUD,TMP1,TMP2) 
 N OR,ATNASSO,VAL,%FIN,NOMRESO,REPPERE,NOTE,LGLO,TYP,TYPREG,RES,ETUF,ETUP
 D CLEAR^%SYSUTI1
 S LGLO=$$TEMP^%SGUTIL
 S REP=$$REPETAT,REPPERE=$$REPRESO,NOMRESO=$$NOMRESO(NOEUD)
 
 
 
 
 G:'($$AIR^%QSGE5(REP,NOEUD,"COMMENTAIRE.PROLOGUE")) REGLES
 G:$$^%QSCALIN(REPPERE,NOMRESO,"CONTEXTE.D.ACTIVATION","EXPERT")=1 REGLES
 K @(LGLO)
 D MVG^%QSCALVA(REP,NOEUD,"COMMENTAIRE.PROLOGUE",LGLO,.TYP)
 S OR=$O(@LGLO@("")),NOTE=@LGLO@(OR)
 D AFF^%QSNOTE2(0,11,80,11,REP,NOEUD,"COMMENTAIRE.PROLOGUE",NOTE,OR,REPIND,IND,"$$AFFICH^%QMEAROU")
 K @(LGLO)
 
REGLES 
 
 S OR="EXPOSE"
 G:'($$OAIR^%QSGE5(REP,NOEUD,"REGLE",OR)) FINREG
 S VAL=$$VALEUR^%QSTRUC8(REP,NOEUD,"REGLE",OR)
 S TYPREG=$P(VAL,"\")
 G:TYPREG'="TRAITER" FINREG
 
 
 
TRAITER 
 S VAL=$P(VAL,"\",2)
 I $D(^BATCHMOD($J)),^BATCHMOD($J) S RES=$$TRTMAP^%TLOB17(VAL,REPIND,IND) G FINREG
 
 
 S ETUP=""
 I $E(^TOZE($J,"JRN"),$L(^TOZE($J,"JRN"))-1) S ETUP=$$GET^%SGVAR("JRN") D NOUVINST^%AMJAJ(ETUP,"execution d'un traitement",NOMRESO_$C(0)_$P(NOEUD,",",2)_$C(0)_REPIND_$C(0)_IND),ADDEXEC^%AMJAJ(ETUP,"REGLE","",VAL,"","","","","")
 
 I $E(^TOZE($J,"JRN"),$L(^TOZE($J,"JRN"))) D EXECTRT^%AMREXDK(VAL,REPIND,IND)
 I '($E(^TOZE($J,"JRN"),$L(^TOZE($J,"JRN")))) S RES=$$CONTEXT^%TLIACUN(VAL,REPIND,IND,0,0,0,.CXT,.ABANDON)
 I $E(^TOZE($J,"JRN"),$L(^TOZE($J,"JRN"))-1) S ETUP=$$GET^%SGVAR("JRN") D AJJOURN^%AMJAJ(ETUP,"retour de l'execution d'un traitement")
 
 
 
FINREG 
 S ATNASSO=$$^%QSCALIN(REP,NOEUD,"RESEAU.ASSOCIE",1)
 G:ATNASSO="" FIN
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
 D APPATN^%QMEXAT6(ATNASSO,TMP1,TMP2)
 I ETUF'="" D DEP^%SGVAR("JRN")
 I $E(^TOZE($J,"JRN"),$L(^TOZE($J,"JRN"))-1) S ETUP=$$GET^%SGVAR("JRN") D AJJOURN^%AMJAJ(ETUP,"retour d'une execution de reseau")
 
 
FIN D CLEAR^%SYSUTI1
 Q
 
 
 
NOMRESO(ETAT) Q $P(ETAT,",")
REPRESO() Q $$NOMINT^%QSF("RESEAU")
REPETAT() Q $$NOMINT^%QSF("ETAT.RESEAU")
 ;
 ;

