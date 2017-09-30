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

;%QMDAGE2^INT^1^59547,73877^0
QMDAGE2 ;;06:29 PM  24 May 1996
 
 
 
 
 
IMPR 
 N %PORT
 S %PORT=^TABIDENT(WHOIS,"PRINTER")
 D MSG^%VZEATT($$^%QZCHW("Impression en cours"))
 O %PORT U %PORT ;;:(132)
 W #,!,$$^%QZCHW("Le "),$$DATE^%QMDATE,$$^%QZCHW(" a "),$$HEURE^%QMDATE,!,!
 W ?30,$$^%QZCHW("Attributs de type date"),!
 W !,!,?5,$$^%QZCHW("Attribut"),?37,$$^%QZCHW("Repertoire"),?60,$$^%QZCHW("Format"),?67,$$^%QZCHW("Libelle format"),!,!
 S ATR=""
 F %I=0:0 S ATR=$O(@^GLO@(ATR)) Q:(ATR="")!(ATR="z")  W ?2,$P(ATR,"/",1),?40,$P(ATR,"/",2),?63,$$AT(ATR,"FORMAT"),?70,$$AT(ATR,"LIBELLE.FORMAT"),!,!
 C %PORT
 D ^%VZEAVT($$^%QZCHW("Impression terminee ... ")) Q
 
IMPF 
 N LI,SOR
 D POCLEPA^%VVIDEO W $$^%QZCHW("Impression sur ") S SOR=$$^%VZESOR("E") Q:(SOR'=1)&(SOR'=0)
 G @SOR
0 
 D LIST^%QMDAUC,REAFF^%QMDAGES
 Q
1 
 N %F,DX,%PORT
 D MSG^%VZEATT($$^%QZCHW("Impression en cours"))
 S %PORT=^TABIDENT(WHOIS,"PRINTER"),LI=""
 O %PORT::1
 E  D ^%VZEAVT($$^%QZCHW("Porte de sortie indisponibles")) Q
 U %PORT w # ;;:(132) W #
 W !,!,?30,$$^%QZCHW("Formats d'affichage"),!,!
 S DX=6
 F %F=0:0 S LI=$O(^RQSGLU("QMDA","FORM",LI)) Q:LI=""  W ?DX,LI S DX=DX+6 W ?DX,^RQSGLU("QMDA","FORM",LI) S DX=DX+26 I DX>50 W ! S DX=6
 C %PORT
 D ^%VZEAVT($$^%QZCHW("Impression terminee")) Q
 
CREA 
 K RESUL D AFF Q
 
MOD() 
 D ^%QUAPAD($$^%QZCHW("MODIFICATION D'UN ATTRIBUT"))
 S ATR=$$UN^%QUAPAGM Q:ATR="" 1
 S RESUL(1)=$P(ATR,"/",1),RESUL(2)=$P(ATR,"/",2)
 S RESUL(3)=$$AT(ATR,"FORMAT"),RESUL(4)=$$AT(ATR,"LIBELLE.FORMAT")
 D AFF Q 2
 
AFF 
 N %B,BR,GLOB,AT,LF
 D ^%VACTGRQ("QMDATAT",.RESUL) Q:ABENDSCR=1
 I RESUL(2)'="*" D INSAT(RESUL(1)_"/"_RESUL(2)) G FIN
 
 S ATR=RESUL(1)_"/*",F=$$AT(ATR,"FORMAT"),LF=$$AT(ATR,"LIBELLE.FORMAT"),BR=""
 D ^%VZEATT,REPA^%QSGEST9("GLOB"),SX^%QSGESTK("ATTRIBUT",ATR)
 F %B=0:0 S BR=$O(GLOB(BR)) Q:BR=""  S ATR=RESUL(1)_"/"_BR D INS,INSAT(ATR)
FIN D INIT^%QMDAGES,INIT2^%QUAPAGM Q
 
INSAT(A) 
 S R=$$AT(A,"REPERTOIRE"),AT=$P(A,"/",1) S:R="" R=$P(A,"/",2)
 D PA^%QSGESTI("ATTRIBUT",A,"TYPE","DATE",1),PA^%QSGESTI("ATTRIBUT",A,"NOM",A,1)
 D PA^%QSGESTI("ATTRIBUT",A,"DERNIER.FORMAT.UTILISE",$$AT(A,"FORMAT"),$I)
 Q
 
INS 
 D PA^%QSGESTI("ATTRIBUT",ATR,"FORMAT",F,1),PA^%QSGESTI("ATTRIBUT",ATR,"LIBELLE.FORMAT",LF,1)
 D PA^%QSGESTI("ATTRIBUT",ATR,"REPERTOIRE",BR,1),PA^%QSGESTI("ATTRIBUT",ATR,"ATTRIBUT",RESUL(1),1)
 Q
 
AT(I,A) 
 Q $$^%QSCALVA("ATTRIBUT",I,A)
 
SUP() 
 K ^WWEN($J)
 N ENS,REP,I
 S ENS="^WWEN($J)"
 D ^%QUAPAD($$^%QZCHW("SUPPRESSION D' ATTRIBUT(S)")),ENS^%QUAPAGM(.ENS)
 Q:$D(^WWEN($J))=0 1
 D POCLEPA^%VVIDEO S REP=$$CONFIRM^%VZEOUI($$^%QZCHW("Voulez-vous toujours supprimer cet(ces) attribut(s) ?"))
 I REP=1 D L0,INIT^%QMDAGES,INIT2^%QUAPAGM
 K ^WWEN($J) Q:REP=1 2
 Q 1
L0 
 D MSG^%VZEATT($$^%QZCHW("Suppression en cours"))
 S ATR=""
 F I=1:1 S ATR=$O(^WWEN($J,ATR)) Q:ATR=""  D SX^%QSGESTK("ATTRIBUT",ATR)
 Q
 
AJOUT(REP,AT,FORM) 
 N A
 I '($D(^RQSGLU("QMDA"))) D ^%QMDAINI
 Q:'($$EX^%QMDAUC(FORM))
 S A=AT_"/"_REP
 D PA^%QSGESTI("ATTRIBUT",A,"TYPE","DATE",1),PA^%QSGESTI("ATTRIBUT",A,"NOM",A,1)
 D PA^%QSGESTI("ATTRIBUT",A,"DERNIER.FORMAT.UTILISE",$$AT(A,"FORMAT"),$I)
 D PA^%QSGESTI("ATTRIBUT",A,"FORMAT",FORM,1)
 D PA^%QSGESTI("ATTRIBUT",A,"LIBELLE.FORMAT",^RQSGLU("QMDA","FORM",FORM),1)
 D PA^%QSGESTI("ATTRIBUT",A,"REPERTOIRE",REP,1)
 D PA^%QSGESTI("ATTRIBUT",A,"ATTRIBUT",AT,1)
 Q
 ;

