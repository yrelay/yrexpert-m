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

;%HXPARC2^INT^1^59547,73870^0
%HXPARC2 ;
 
 
 
 
 
 
 
MEN 
 I '($$EX^%QSGEST7(@TEMP@("LISTE"))) D ^%VZEAVT($$^%QZCHW("La liste qui a servi a definir l'histogramme n'existe plus; vous ne pouvez pas le modifier")) Q
 N %M,MCBL
 S MCBL(1)=$$^%QZCHW("Traitement")_"^"_"TRT"
 I $D(^HISTMN(WHOIS)) D @^HISTMN(WHOIS)
 S DY=LMENU,DX=0 D CLEBAS^%VVIDEO
SELH D ^%VQUIKMN(5,79,LMENU,"MCBL",.ADR,.CTR) G:ADR'="" @ADR
 I "AF"[CTR K CTR Q
 D ^%VSQUEAK G SELH
 
TRT 
 N TRT
TR D POCLEPA^%VVIDEO
 S TRT=$$^%VZAME1($$^%QZCHW("Nom du traitement a activer : ")) I TRT="" D POCLEPA^%VVIDEO Q
 I TRT="?" S TRT=$$^%QUCHOYO("^[QUI]TTL",.R,1) G:TRT="" TR
 I '($D(^[QUI]TTL(TRT))) D ^%VZEAVT($$^%QZCHW("Traitement inconnu ")) G TR
 K ^TRT S ^TRT(1)=TRT
 D ^%VZEATT,^%QCAMEMS
 N %I,ACT,CARD,IND,NOML,TEMPOT
 S IND="",TEMPOT=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMPOT)
 F %I=0:0 S IND=$O(@GL@(CS,"IND",IND)) Q:IND=""  I $$IR^%QSGEST5(REPI,IND) S @TEMPOT@(IND)="",@IMOD@(IND)=""
 I '($D(@TEMPOT)) D FIN Q
 S TRT=^TRT(1),NOML=$$NOM^%QSGES11("TMP"),CARD=$$CARD^%QSGES11(TEMPOT)
 D COPY^%QSGES11(NOML,REPI,CARD,TEMPOT),CREER^%QSGES11(REPI,NOML,"TMP",CARD,"TEMPORAIRE","","TEMPORAIRE")
 S ACT=$$ACTIVL^%TLIACTI(TRT,NOML,0,0)
 D DEL^%QSGES11(NOML)
 D FIN Q
FIN K @(TEMPOT)
 D ^%QCAMEMR Q
 
 
DEPL(GL,REG,REP,CS,IMOD) 
 
 
 
 
 
 
 N VATREG,COLREG,Y1,I,%I
 I $$TYPE^%QSGEST9(REP,REG)'=0 D ^%VZEAVT($$^%QZCHW("Vous ne pouvez pas modifier un attribut lien")) Q
 S COLREG=CS
 
 S VATREG=@GL@(COLREG,"TEXT")
 
 D POCLEPA^%VVIDEO
 D LIRE2^%VREAD($$^%QZCHW("Nouveau")_" "_REG_" ? ","",1,RM-4,DY+1,DY-1,"","$$UCR^%HXPARC2",.CTR,.Y1)
 Q:(CTR=0)!(Y1="")
 
 D MSG^%VZEATT($$^%QZCHW("Mise a jour des individus de la colonne"))
 K @(IMOD)
 S I="" F %I=1:1 S I=$O(@GL@(COLREG,"IND",I)) Q:I=""  S @IMOD@(I)="" D PA^%QSGESTI(REP,I,REG,Y1,1)
 Q
 
UCR(YY1,REAF) 
 S REAF=0
 I YY1="" Q 1
 I '($$FINT^%QMDAUC(REP,REG,.YY1)) D ^%VZEAVT($$^%QZCHW("Saisie incorrecte")) Q 0
 Q 1

