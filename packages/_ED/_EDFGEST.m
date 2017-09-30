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

;%EDFGEST^INT^1^59547,73869^0
%EDFGEST ;;03:36 PM  28 Dec 1991; ; 08 Oct 92  9:30 AM
 
 
 
 
 
SIGNAL(TTT) 
 Q:'($$REPM^%QSGEST9("TRAITEMENT"))
 I TTT="z" D:$$EXISTE^%TLQUER("f."_TTT) SUPP^%TLQUER("f."_TTT) Q
 I '($D(^[QUI]EDFORMAT(TTT))) D:$$EXISTE^%TLQUER("f."_TTT) SUPP^%TLQUER("f."_TTT) Q
 D:'($$EXISTE^%TLQUER("f."_TTT)) CREER^%TLQUER("f."_TTT) Q
 Q
 
EXISTE(TTT) 
 D SIGNAL(TTT)
 Q $D(^[QUI]EDFORMAT(TTT))
 
CREER(TTT) 
 D CREER^%TLQUER("f."_TTT)
 D AFFVAL^%TLQUER("f."_TTT,"ANALYSE.CORRECTE",1,1)
 Q
 
SUPP(MOD) 
 N L,%L
 S L="" F %L=0:0 S L=$O(^[QUI]EDFORMAT(MOD,"LIGNE",L)) Q:L=""  I $D(^[QUI]EDFORMAT(MOD,"LIGNE",L,"TETE")) D KILL^%ANA(^[QUI]EDFORMAT(MOD,"LIGNE",L,"TETE"))
 K ^[QUI]EDFORMAT(MOD)
 D SUPP^%TLQUER("f."_MOD)
 Q
 
 
MAJ(TTT,MODIF,ANAL,ANAOK) 
 D:'($$EXISTE^%TLQUER("f."_TTT)) CREER^%TLQUER("f."_TTT)
 D MAJ^%TLQUER2("^[QUI]EDFORMAT("""_TTT_""",""LIGNES"")","f."_TTT,MODIF,ANAL,ANAOK)
 Q
 
 
AFFVAL(TTT,ATTRIB,INDICE,VALEUR) 
 N I
 Q:'($D(^[QUI]EDFORMAT(TTT)))
 F I="DER.ACCES","CREATION" I ATTRIB=I,INDICE=1 S ^[QUI]EDFORMAT(TTT,ATTRIB)=VALEUR Q
 D AFFVAL^%TLQUER("f."_TTT,ATTRIB,INDICE,VALEUR)
 Q
 
DUPL(WHOIS1,QUI1,S,WHOIS2,QUI2,D) N A,%A,AA,L,SVQUI,SVWHOIS
 K ^[QUI2]EDFORMAT(D)
 S NOMTREE="^[QUI1]EDFORMAT("""_S_"""",%TREECOP="^[QUI2]EDFORMAT("""_D_"""" D ^%QCAGLC
 S SVQUI=QUI,SVWHOIS=WHOIS,QUI=QUI2,WHOIS=WHOIS2 D CREER(D) S QUI=SVQUI,WHOIS=SVWHOIS
 D RECTRT^%TLQUER3(WHOIS1,QUI1,"f."_S,WHOIS2,QUI2,"f."_D,1,1)
 Q

