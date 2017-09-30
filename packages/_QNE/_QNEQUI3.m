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

;%QNEQUI3^INT^1^59547,73879^0
QNEQUI3 ;
 
 
 
 
INIGL 
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 F I="MEN","INSEP","INSEPI","INCOMP","INCOMPG","INCOMPL","INC","VT","APPEL" S @I=$$CONCAS^%QZCHAD(TEMP,I)
 F I="GROSEP","GROCOM","LLISTE" S @VT@(I)=$$CONCAS^%QZCHAD(TEMP,I)
 S @VT@("GRO")=$$CONCAS^%QZCHAD(TEMP,"GROAFF")
 D STATSET^%QNEQUI8(VT,"MAJ.INDICATEURS",1)
 Q
 
INIAT(NOM,MSG) 
 N %Z,ETU,GAM,REPG
 S ETU=$$REP^%QNEQETU,MSG=""
 D MSG^%VZEATT($$^%QZCHW("Recuperation des attributs de l'etude"))
 S TEMPS=$$AT1("ATTRIBUT.CAPACITE",1)
 S NCOADDI=$$AT1("NOMBRE.AUTRES.CONTRAINTES.ADDITIVES",1)
 I NCOADDI>0 S NCOADDI=NCOADDI+1
 F %Z=2:1:NCOADDI S TEMPS(%Z)=$$AT1("ATTRIBUT.CAPACITE",%Z)
 S CYCLE=$$AT("CYCLE")
 F %Z=2:1:NCOADDI S CYCLE(%Z)=$$AT1("CYCLE",%Z)
 S TAL=$$AT("TRAITEMENT.ACCEPTATION.LOCAL")
 S TAG=$$AT("TRAITEMENT.ACCEPTATION.GLOBAL")
 S INSEPK=$$AT("LISTE.GROUPES.INSEPARABLES")
 S INCOMPK=$$AT("LISTE.GROUPES.INCOMPATIBLES")
 S LLISTEN=$$AT("LISTE.POSTES")
 S DMULT=$$AT("EFFECTIF.MAX.PAR.POSTE")
 S L=$$AT("LISTE.OPERATIONS.GAMME")
 S GAM=$$AT("NOM.GAMME")
 S REPG=$$AT("REPERTOIRE.GAMME")
 D MSG^%VZEATT($$^%QZCHW("Tests sur la liste d'operations")_" "_L)
 D RECUP^%QNEQETU(NOM,.REPG,.GAM,.L,.MSG) Q:MSG'=""
 
 S ADRL=$$ADRLT^%QSGEST7(L)
 I (ADRL=0)!(ADRL="") D TRI^%QSGES11(L,.ADRL)
 
 I INCOMPK'="" D MSG^%VZEATT($$^%QZCHW("Tests sur la liste des groupes d'incompatibles")_" "_INCOMPK) S MSG=$$VERIF1^%QNEQETU(REPG,GAM,INCOMPK,"C") Q:MSG'=""
 I INSEPK'="" D MSG^%VZEATT($$^%QZCHW("Tests sur la liste des groupes d'inseparables")_" "_INSEPK) S MSG=$$VERIF1^%QNEQETU(REPG,GAM,INSEPK,"C") Q:MSG'=""
 S BASEL=$$BASE^%QSGEST7(L)
 S @VT@("ETUDE")=NOM
 S @VT@("COMM")=$$AT("COMMENTAIRE")
 S @VT@("DATE")=$$AT("DATE.CREATION")
 S @VT@("DATE.UTILISATION")=$$AT($$DAT)
 S @VT@("TYPE.EQUILIBRAGE")=$$AT($$TYPE)
 S @VT@("REINIT")=$$AT("REINITIALISATION")
 S @VT@("GOTO")=GOTO
 Q
AT(AT) 
 Q $$^%QSCALVA(ETU,NOM,AT)
 
AT1(AT,INDICE) 
 Q $$^%QSCALIN(ETU,NOM,AT,INDICE)
 
AJTYP(NOM,TYP) 
 D PA^%QSGESTI($$REP^%QNEQETU,NOM,$$TYPE,TYP,1)
 S @VT@("TYPE.EQUILIBRAGE")=TYP
 Q
TYPE() Q "TYPE.EQUILIBRAGE"
 
MAJ(NOM) 
 N DAT
 S DAT=$$TEMPS^%QMDATE
 D PA^%QSGESTI($$REP^%QNEQETU,NOM,$$DAT,DAT,1)
 S @VT@("DATE.UTILISATION")=DAT
 Q
DAT() Q "DATE.UTILISATION"
 
MENU(MEN) 
 S @MEN="21^4^79"
 S @MEN@(1)=$$^%QZCHW("Assiste")_"^"_"ASS",@MEN@(1,"COM")=$$^%QZCHW("Equilibrage assiste (controles sur contraintes)")
 S @MEN@(2)=$$^%QZCHW("Automatique")_"^"_"AUT",@MEN@(2,"COM")=$$^%QZCHW("Equilibrage automatique respectant les resultats precedents")
 S @MEN@(3)=$$^%QZCHW("Groupage")_"^"_"GROU",@MEN@(3,"COM")=$$^%QZCHW("Groupage (un individu n'appartient qu'a un seul groupe)")
 S @MEN@(4)=$$^%QZCHW("Groupage.libre")_"^"_"GRLI",@MEN@(4,"COM")=$$^%QZCHW("Groupage libre (un individu peut appartenir a plusieurs groupes)")
 S @MEN@(5)=$$^%QZCHW("Inseparables")_"^"_"SEP",@MEN@(5,"COM")=$$^%QZCHW("Constitution ou modification des groupes d'inseparables")
 S @MEN@(6)=$$^%QZCHW("Incompatibles")_"^"_"COM",@MEN@(6,"COM")=$$^%QZCHW("Constitution ou modification des groupes d'incompatibles")
 S @MEN@(7)=$$^%QZCHW("Etude")_"^"_"MOD",@MEN@(7,"COM")=$$^%QZCHW("Modification de l'etude")
 S @MEN@(8)=$$^%QZCHW("Resultat")_"^"_"VISU",@MEN@(8,"COM")=$$^%QZCHW("Resultat du dernier equilibrage automatique")
 S @MEN@(9)=$$^%QZCHW("Traitement")_"^"_"TRT",@MEN@(9,"COM")=$$^%QZCHW("Acces au menu des traitements")
 Q
 
VISU(NOM) 
 N GL,AFF,OR,ETU,VN
 S ETU=$$REP^%QNEQETU,VN="COMPTE-RENDU"
 S OR=$$OR^%QSCALVA(ETU,NOM,"NOTE",VN) I OR="" D MSG^%VZEATT($$^%QZCHW("Aucune erreur lors du dernier equilibrage automatique")) H 2 Q
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("erreurs"),0)
 D ^%QSNOTE("C",0,1,79,21,ETU,NOM,"NOTE",VN,OR,.GL,.AFF)
 Q
 
LLISTEN(LL,TYPE) 
 
 
 
 
 
 I LL'="" D SUPL^%QNEQETU(LL)
 S LL=$$NOM^%QSGES11($S(TYPE="S":"EQS",TYPE="C":"EQC",1:"EQL"))
 D MSG^%VZEATT($$^%QZCHW("Creation de la liste des "_$S(TYPE="S":"groupes d'inseparables",TYPE="C":"groupes d'incompatibles",1:"postes"))_" "_LL)
 D CRETYP^%QSGES11("L0",LL,"EQL",0,"EQUILIBRAGE",$$STO^%QSGES11(LL),$S(TYPE="S":"INSEPARABLES DE",TYPE="C":"INCOMPATIBLES DE",1:"SORTIE DE")_" "_NOM,"INDIVIDU",$$STOTRI^%QSGES11)
 Q
 
CRELIS 
 N LIND,LH,INSEPL,LG,LINDS,LHS,INSEPLS,LGS
 D ^%VZEATT,ADR(NOM,BASEL,0,.LIND,.LINDS)
 D ADR(NOM,BASEL,0,.LH,.LHS)
 D ADR(NOM,BASEL,0,.INSEPL,.INSEPLS)
 D ADR(NOM,BASEL,"L",.LG,.LGS)
 S @VT@("LIND")=LIND,@VT@("LH")=LH
 S @VT@("INSEPL")=INSEPL,@VT@("LG")=LG
 D STATSET^%QNEQUI8(VT,"CREATION.LISTES.TEMPO",1)
 Q
 
ADR(NOM,BASEL,M,LMN,LM) 
 
 
 N TL S TL="EQL"
 I M=0 S TL="TMP"
 I M="L" S BASEL="L0"
 S LMN=$$NOM^%QSGES11(TL),LM=$$STO^%QSGES11(LMN)
 I (M'=0)&(M'="L") D MSG^%VZEATT($$^%QZCHW("creation d'un poste : liste")_" "_LMN)
 D CRETYP^%QSGES11(BASEL,LMN,TL,0,"EQUILIBRAGE",LM,"ETUDE "_NOM,"INDIVIDU",$$STOTRI^%QSGES11)
 I (M'=0)&(M'="L") D CRDES^%QFGRACT(LMN,M,"E")
 Q

